import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mgosme/utilities/alert_dialog.dart';

import 'widgets/list_info_widget.dart';
import 'widgets/maps_address.dart';
import 'widgets/radio_button_occupation.dart';
import 'widgets/radio_status.dart';
import 'widgets/rqcode_viewer.dart';
import 'widgets/slide_popup.dart';
import 'widgets/view_image_profile.dart';

class Profile extends StatefulWidget {
  final userID;

  Profile({this.userID});

  @override
  _ProfileState createState() => _ProfileState(uid: userID);
}

TextEditingController emailController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController surnameController = TextEditingController();
TextEditingController creditController = TextEditingController();

class _ProfileState extends State<Profile> {
  final uid;
  String birthday;

  _ProfileState({this.uid});

  DateTime _dateTime = DateTime.now();

  /// Image Picker

  final picker = ImagePicker();
  File _selectImageFile;
  File _fileQRCode;

  @override
  void initState() {

    getAddress().map((event) {
      setState(() {
        print('Country=====${event.id}');
      });
    });
    super.initState();
  }

  ///Get image form device
  Future getImage(ImageSource source, String username, File file, String field,
      String patch) async {
    final image = await picker.getImage(source: source);
    if (image != null) {
      File cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxHeight: 700,
          maxWidth: 700,
          androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop',
          ));
      setState(() {
        file = cropped;
      });
      uploadImageToStorage(file, username, field, patch);
    }
  }

  ///Upload image to Firebase Storage
  Future uploadImageToStorage(
      File imageFile, String username, String img, String patch) async {
    String url;
    Reference reference = FirebaseStorage.instance
        .ref()
        .child('images/$patch/$uid/profile_$username');
    UploadTask uploadTask = reference.putFile(imageFile);
    await uploadTask.whenComplete(() async {
      print('Upload complete');
      url = await uploadTask.snapshot.ref.getDownloadURL();
      print(url);
      _updateProfile({
        img: url,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ຂໍ້ມູນຜູ້ໃຊ້',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 1,
        backgroundColor: Color(0xFFFAFAFA),
      ),
      body: StreamBuilder(
        stream: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          }
          Map<String, dynamic> data = snapshot.data.data();
          Map<String, dynamic> address = data['address'];
          phoneController.text = data['tel'];
          creditController.text = data['accountNo'];
          return Container(
            margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ViewProfile(),
                          ));
                        },
                        child: Container(
                          width: 105,
                          height: 105,
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            shape: BoxShape.circle,
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: data['urlProfile'] == null
                                    ? Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border:
                                              Border.all(color: Colors.grey),
                                          image: DecorationImage(
                                            image: _selectImageFile == null
                                                ? AssetImage('images/mgo.png')
                                                : FileImage(_selectImageFile),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    : CachedNetworkImage(
                                        imageUrl: data['urlProfile'],
                                        imageBuilder: (context, imageProvider) {
                                          return Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.grey),
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right: 8,
                                    bottom: 5,
                                  ),
                                  child: InkWell(
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 0.25,
                                          )),
                                      child: Icon(
                                        Icons.camera_alt,
                                        size: 15,
                                      ),
                                    ),
                                    onTap: () {
                                      buildChooseSourceDialog(
                                          onPressedCamera: () {
                                        Navigator.of(context).pop();
                                        getImage(
                                                ImageSource.camera,
                                                data['name'],
                                                _selectImageFile,
                                                'urlProfile',
                                                'profile')
                                            .then((value) {
                                          Navigator.of(context).pop();
                                        });
                                      }, onPressedPhoto: () {
                                        getImage(
                                                ImageSource.gallery,
                                                data['name'],
                                                _selectImageFile,
                                                'urlProfile',
                                                'profile')
                                            .then((value) {
                                          Navigator.of(context).pop();
                                        });
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'ຂໍ້ມູນພື້ນຖານ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Divider(
                      thickness: 1,
                    ),

                    ///name
                    ListInfo(
                      icon: Icons.account_circle_outlined,
                      text: '${data['name']} ${data['surname']}',
                      onTap: () {
                        nameController.text = '${data['name']}';
                        surnameController.text = '${data['surname']}';

                        _buildTextField(
                            {TextEditingController controller, String label}) {
                          return Card(
                            child: Container(
                              padding: EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: TextField(
                                style: TextStyle(fontSize: 14),
                                controller: controller,
                                decoration: InputDecoration(
                                    prefixText: '$label: ',
                                    isDense: true,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    contentPadding:
                                        EdgeInsets.only(top: 6, bottom: 6)),
                              ),
                            ),
                          );
                        }

                        buildShowModalBottomSheet(
                            widget: Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                children: [
                                  Text('ປ່ຽນຊື່'),
                                  _buildTextField(
                                      controller: nameController, label: 'ຊື່'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  _buildTextField(
                                      controller: surnameController,
                                      label: 'ນາມສະກຸນ'),
                                ],
                              ),
                            ),
                            onPressed: () {
                              if (nameController.text == '${data['name']}' &&
                                  surnameController.text ==
                                      '${data['surname']}') {
                                Navigator.of(context).pop();
                              } else if (nameController.text == '' ||
                                  surnameController.text == '') {
                                CustomAlertDialog().showWarningDialog(
                                    context, 'ຜິດພາດ', 'ຊື່ບໍ່ສາມາດວ່າງໄດ້');
                              } else {
                                CustomAlertDialog().optionDialog(
                                    context,
                                    'ຢືນຢັນ',
                                    'ທ່ານຕ້ອງການທີ່ຈະປ່ຽນຊື່ເປັນ${nameController.text} ຫຼື ບໍ່?',
                                    () {
                                  _updateProfile(
                                    {
                                      'name': nameController.text,
                                      'surname': surnameController.text,
                                    },
                                  ).then((value) {
                                    CustomAlertDialog()
                                        .loadingDialog(context)
                                        .then(
                                          (value) => Navigator.of(context)
                                              .maybePop()
                                              .then(
                                                (value) =>
                                                    Navigator.of(context).pop(),
                                              ),
                                        );
                                  });
                                });
                              }
                            });
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),

                    ///Gender
                    ListInfo(
                      icon: Icons.wc,
                      text: '${data['sex']}',
                      onTap: () {
                        _buildSelectedGender(data['sex']);
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),

                    ///BirthDay
                    ListInfo(
                      icon: Icons.perm_contact_calendar,
                      text: '${data['birthday']}',
                      onTap: () {
                        _buildSelectBirthDay();
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),

                    ///Status
                    ListInfo(
                      icon: Icons.favorite,
                      text: data['status'] == null
                          ? 'ບໍ່ໄດ້ກຳນົດ'
                          : '${data['status']}',
                      onTap: () {
                        buildRadioButtonStatus(data['status']);
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),

                    ///Occupation
                    ListInfo(
                      icon: Icons.work,
                      text: data['occupation'] == null
                          ? 'ບໍ່ໄດ້ກຳນົດ'
                          : '${data['occupation']}',
                      onTap: () {
                        buildOccupation(data['occupation']);
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    /// Contact
                    Text(
                      'ຂໍ້ມູນຕິດຕໍ່',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(),

                    ///Phone Number
                    ListInfo(
                      icon: Icons.phone,
                      text: data['tel'] == null
                          ? 'ບໍ່ໄດ້ກຳນົດ'
                          : '${data['tel']}',
                      onTap: () {
                        _showDialogText(
                          controller: phoneController,
                          title: 'ເບີໂທ',
                          hintText: '+856',
                          onPress: () {
                            if (phoneController.text == '') {
                              CustomAlertDialog().showWarningDialog(context,
                                  'ຜິດພາດ', 'ກະລຸນາໃສ່ຂໍ້ມູນໃຫ້ຖືກຕ້ອງ');
                            } else if (phoneController.text == data['tel']) {
                              _navigationPop();
                            } else {
                              CustomAlertDialog().optionDialog(
                                  context, 'ຢືນຢັນ', 'ທ່ານຕ້ອງການປຽນແປງຫຼືບໍ່?',
                                  () {
                                _updateProfile({
                                  'tel': phoneController.text,
                                }).then(
                                  (value) => CustomAlertDialog()
                                      .loadingDialog(context)
                                      .then(
                                        (value) => Navigator.of(context)
                                            .maybePop()
                                            .then(
                                              (value) =>
                                                  Navigator.of(context).pop(),
                                            ),
                                      ),
                                );
                              });
                            }
                          },
                        );
                      },
                    ),

                    SizedBox(
                      height: 8,
                    ),

                    ///Email
                    ListInfo(
                      icon: Icons.email,
                      text: '${data['email']}',
                      onTap: () {
                        emailController.text = data['email'];
                        _showDialogText(
                          controller: emailController,
                          title: 'Enter your email',
                          hintText: 'Email',
                          onPress: () {
                            _updateProfile({
                              'email': emailController.text,
                            }).then((value) => Navigator.of(context).pop());
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    Text(
                      'ຂໍ້ມູນທີຢູ່',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),

                    ///Address
                    ListInfo(
                      icon: Icons.home_rounded,
                      text: data['address'] == null
                          ? 'ບໍ່ໄໄດ້ກຳນົດ'
                          : '${address['province']}, ${address['street']}, ${address['village']}',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MapsAddress(
                            uid: uid,
                          ),
                        ));
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'ຂໍ້ມູນທະນາຄານ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),

                    ///Bank Detail
                    ListInfo(
                      icon: Icons.credit_card,
                      text: data['accountNo'] == null
                          ? 'ບໍ່ໄດ້ກຳນົດ'
                          : '${data['accountNo']}',
                      onTap: () {
                        _showDialogText(
                          controller: creditController,
                          title: 'ເລກບັນຊີ',
                          hintText: 'ເລກບັນຊີ',
                          onPress: () {
                            try {
                              _updateProfile({
                                'accountNo': creditController.text,
                              }).then((value) => Navigator.of(context).pop());
                            } catch (e) {
                              print(e.toString());
                            }
                          },
                        );
                      },
                    ),

                    SizedBox(
                      height: 8,
                    ),

                    ///QRCode
                    ///
                    Text('ລະຫັດ QRCode'),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      color: Colors.grey[100],
                      height: 200,
                      child: Center(
                        child: data['qrcode'] == null
                            ? IconButton(
                                icon: Icon(Icons.qr_code),
                                onPressed: () {
                                  buildChooseSourceDialog(onPressedCamera: () {
                                    Navigator.of(context).pop();
                                    getImage(ImageSource.camera, data['name'],
                                            _fileQRCode, 'rqcode', 'qrcode')
                                        .then((value) {
                                      Navigator.of(context).pop();
                                    });
                                  }, onPressedPhoto: () {
                                    getImage(ImageSource.gallery, data['name'],
                                            _fileQRCode, 'qrcode', 'qrcode')
                                        .then((value) {
                                      Navigator.of(context).pop();
                                    });
                                  });
                                })
                            : InkWell(
                                child: Image.network(data['qrcode']),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => QRCodeViewer(
                                      imgUrl: data['qrcode'],
                                    ),
                                  ));
                                },
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  buildOccupation(String value) {
    buildShowModalBottomSheet(
      widget: Column(
        children: [
          Text('ເລືອກອາຊີບ'),
          RadioOccupation(
            occupation: [
              'ວ່າງວຽກ',
              'ກຳລັງເຮັກວຽກຢູ່',
              'ວຽກອິດສະຫຼະ',
              'ນັກສຶກສາ'
            ],
            selected: value,
          ),
        ],
      ),
      onPressed: () {
        if (selectValueOccupation == null) {
          CustomAlertDialog().showWarningDialog(
              context, 'ຜິດພາດ', 'ກະລຸນາເລືອກຢ່າງນ້ອຍໜຶ່ງລາຍການ');
        } else {
          _updateProfile({'occupation': selectValueOccupation}).then(
            (value) {
              CustomAlertDialog().loadingDialog(context).then(
                    (value) => _navigationPop(),
                  );
            },
          );
        }
      },
    );
  }

  ///Bottom Sheet
  Future buildShowModalBottomSheet({Widget widget, VoidCallback onPressed}) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (builder) {
          return Container(
            child: Column(
              children: [
                Icon(
                  Icons.minimize,
                  size: 30,
                ),
                SizedBox(
                  height: 5,
                ),
                widget,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      child: Text(
                        'ຍົກເລີກ',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        _navigationPop();
                      },
                    ),
                    MaterialButton(
                      child: Text(
                        'ຕົກລົງ',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: onPressed,
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }

  /// Build status Widget
  buildRadioButtonStatus(String status) {
    buildShowModalBottomSheet(
      onPressed: () {
        CustomAlertDialog().loadingDialog(context).then((value) {
          _updateProfile({
            'status': selectedStatus,
          }).then((value) => Navigator.of(context).pop());
        });
      },
      widget: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ສະຖານະ',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            RadioButtonStatus(
              selected: status,
            ),
          ],
        ),
      ),
    );
  }

  ///select image
  buildChooseSourceDialog(
          {VoidCallback onPressedPhoto, VoidCallback onPressedCamera}) =>
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('ເລືອກຕຳແໜ່ງຮູບພາບ'),
            content: Container(
              height: 115,
              child: Column(
                children: [
                  ListTile(
                      leading: Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                      ),
                      title: Text('ຖ່າຍຮູບ'),
                      dense: true,
                      onTap: onPressedCamera),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.photo,
                      color: Colors.black,
                    ),
                    title: Text('ເລືອກຮູບພາບ'),
                    dense: true,
                    onTap: onPressedPhoto,
                  ),
                ],
              ),
            ),
          );
        },
      );

  void _showDialogText({
    VoidCallback onPress,
    String title,
    String hintText,
    TextEditingController controller,
  }) {
    buildShowModalBottomSheet(
      onPressed: onPress,
      widget: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              style: TextStyle(fontSize: 16),
              controller: controller,
              decoration: InputDecoration(isDense: true, hintText: hintText),
            ),
          ],
        ),
      ),
    );
  }

  void _buildSelectedGender(String sex) {
    int sexIndex = 0;
    if (sex == 'ຊາຍ') {
      sexIndex = 0;
    } else if (sex == 'ຍິງ') {
      sexIndex = 1;
    } else {
      sexIndex = 2;
    }
    buildShowModalBottomSheet(
      onPressed: () {
        CustomAlertDialog().optionDialog(
            context, 'ຢືນຢັນ', 'ທ່ານຕ້ອງການທີ່ຈະເຮັດການປ່ຽນແປງ ຫຼື ບໍ?', () {
          _updateProfile({
            'sex': sexSelected,
          }).then(
            (value) {
              return CustomAlertDialog().loadingDialog(context).then((value) {
                Navigator.of(context).maybePop().then(
                      (value) => Navigator.of(context).pop(),
                    );
              });
            },
          );
        });
      },
      widget: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '    ເລືອກເພດ',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            SelectGender(
              index: sexIndex,
            ),
          ],
        ),
      ),
    );
  }

  ///Dialog Show Birthday
  void _buildSelectBirthDay() {
    buildShowModalBottomSheet(
      onPressed: () {
        CustomAlertDialog().loadingDialog(context).then(
              (value) => _updateProfile({
                'birthday': birthday,
              }).then(
                (value) => Navigator.of(context).pop(),
              ),
            );
      },
      widget: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ວັນ, ເດືອນ ປີເກີດ',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildDatePicker(),
          ],
        ),
      ),
    );
  }

  ///BirthDay Selection
  SizedBox buildDatePicker() {
    return SizedBox(
      height: 100,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.date,
        initialDateTime: _dateTime,
        onDateTimeChanged: (dateTime) {
          setState(() {
            _dateTime = dateTime;
            birthday = '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}';
          });
        },
      ),
    );
  }

  ///Update Profile
  Future _updateProfile(Map<String, dynamic> map) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).update(map);
  }

  getData() {
    return FirebaseFirestore.instance.collection('users').doc(uid).snapshots();
  }

  Stream<DocumentSnapshot> getAddress()  {
    return  FirebaseFirestore.instance
        .collection('address')
        .doc(uid)
        .snapshots();
  }

  void _navigationPop() {
    Navigator.of(context).pop();
  }
}
