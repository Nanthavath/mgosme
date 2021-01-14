import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/widgets/input_formater.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/widgets/back_button.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/widgets/dropdown_widget.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/widgets/maps_address.dart';
import 'package:mgosme/pages/home/screen/home_app/more_page/profiles/widgets/next_buttton.dart';

import 'education.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

TextEditingController name = TextEditingController();
TextEditingController surname = TextEditingController();
String gender = '';

List<String> genders = ['   ຊາຍ', '   ຍິງ', '   ອື່ນໆ'];

class _InfoState extends State<Info> {
  File _coverImg;
  File _profileImg;

  final picker = ImagePicker();

  ///Choose image picker for cover
  Future getImageCover(ImageSource imageSource) async {
    try {
      final pickedFile = await picker.getImage(source: imageSource);
      if (pickedFile != null) {
        ///Cropped Image
        File croppedFile = await ImageCropper.cropImage(
            sourcePath: pickedFile.path,
            aspectRatioPresets: [
              CropAspectRatioPreset.ratio16x9,
            ],
            androidUiSettings: AndroidUiSettings(
                toolbarTitle: 'Cropper',
                toolbarColor: Colors.deepOrange,
                toolbarWidgetColor: Colors.white,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false),
            iosUiSettings: IOSUiSettings(
              minimumAspectRatio: 1.0,
            ));
        setState(() {
          _coverImg = croppedFile;
        });
      } else {
        print('File image is empty');
      }
    } catch (ex) {
      print('GetImage::$ex}');
    }
  }

  ///Get image picker for profile
  Future getImageProfile(ImageSource imageSource) async {
    try {
      final pickedFile = await picker.getImage(source: imageSource);
      if (pickedFile != null) {
        ///Cropped Image
        File croppedFile = await ImageCropper.cropImage(
            sourcePath: pickedFile.path,
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
            ],
            androidUiSettings: AndroidUiSettings(
                toolbarTitle: 'Cropper',
                toolbarColor: Colors.deepOrange,
                toolbarWidgetColor: Colors.white,
                initAspectRatio: CropAspectRatioPreset.square,
                lockAspectRatio: false),
            iosUiSettings: IOSUiSettings(
              minimumAspectRatio: 1.0,
            ));
        setState(() {
          _profileImg = croppedFile;
        });
      } else {
        print('File image is empty');
      }
    } catch (ex) {
      print('GetImage::$ex}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      _cover(),
                      _profile(),
                    ],
                  ),
                  Container(
                    height: 500,
                    child: Column(
                      children: [
                        _textInputName(),
                        DropDownWidget(
                          list: genders,
                          icon: 'icons/gender.png',
                          hint: 'ເລືອກເພດ',
                        ),
                        _textInputDate(),
                        _textInput(
                            ico: 'icons/address.png',
                            hint: 'ທີ່ຢູ່',
                            enabled: false,
                            onTap: () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //   builder: (context) => MapsAddress(),
                              // ));
                            }),
                        _textInput(
                          ico: 'icons/phone.png',
                          hint: 'ເບີໂທ',
                        ),
                        _textInput(
                          ico: 'icons/email.png',
                          hint: 'ອີເມລ',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            BackButtons(),
            Align(
              alignment: Alignment.bottomRight,
              child: NextButtons(
                title: 'ຖັດໄປ',
                onPressed: () {
                  if (gender == '') {
                    print('Please select your gender!!');
                  } else {
                    print(' your gender==$gender');
                  }
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Education(),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _cover() {
    return Container(
      color: Colors.blue,
      height: 200,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: _coverImg == null
                  ? NetworkImage(
                      'https://www.eta.co.uk/wp-content/uploads/2012/09/Cycling-by-water-resized-min.jpg')
                  : FileImage(_coverImg),
              fit: BoxFit.cover,
            )),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: _cameraButton(
              onTap: () {
                _showDialogOptionSources(
                  cameraOnPressed: () {
                    getImageCover(ImageSource.camera);
                  },
                  galleryOnPressed: () {
                    Navigator.of(context).maybePop().then(
                          (value) => getImageCover(ImageSource.gallery),
                        );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  ///Camera Button Choose image
  _cameraButton({VoidCallback onTap}) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(right: 10, bottom: 10),
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
            border: Border.all(color: Colors.white)),
        child: Icon(
          Icons.camera_alt,
        ),
      ),
      onTap: onTap,
    );
  }

  _profile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 150),
          height: 140,
          width: 140,
          child: Stack(
            children: [
              Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white70,
                  border: Border.all(width: 3, color: Colors.white),
                  image: DecorationImage(
                      image: _profileImg == null
                          ? AssetImage('icons/user.png')
                          : FileImage(_profileImg),
                      fit: BoxFit.fill),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: _cameraButton(onTap: () {
                  _showDialogOptionSources(cameraOnPressed: () {
                    getImageProfile(ImageSource.camera);
                  }, galleryOnPressed: () {
                    getImageProfile(ImageSource.gallery);
                  });
                }),
              )
            ],
          ),
        ),
      ],
    );
  }

  textField({TextEditingController controller, String hint}) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: 16,
                top: 8,
                bottom: 8,
                right: 10,
              ),
              border: OutlineInputBorder(borderSide: BorderSide.none),
              isDense: true,
              hintText: '$hint'),
        ),
      );

  _textInputName() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          Image(
            image: AssetImage('icons/user.png'),
            width: 40,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: textField(controller: name, hint: 'ຊື່'),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: textField(controller: surname, hint: 'ນາມສະກຸນ'),
          ),
        ],
      ),
    );
  }

  _textInput({
    TextEditingController controller,
    String hint,
    String ico,
    bool enabled,
    VoidCallback onTap,
  }) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          Container(
            width: 40,
            child: Image.asset(
              ico,
              width: 30,
              height: 30,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: InkWell(
              onTap: onTap,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  enabled: enabled,
                  controller: controller,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        left: 16,
                        top: 8,
                        bottom: 8,
                        right: 10,
                      ),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      isDense: true,
                      hintText: '$hint'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _textInputDate() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          Container(
            width: 40,
            child: Image.asset(
              'icons/calendar.png',
              width: 35,
              height: 35,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6),
                  InputFormatter(),
                ],
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                    left: 16,
                    top: 8,
                    bottom: 8,
                    right: 10,
                  ),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'DD/MM/YY',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDialogOptionSources(
      {VoidCallback cameraOnPressed, VoidCallback galleryOnPressed}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('ທາງເລືອກ'),
          content: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: Text('ກ້ອງຖ່າຍຮູບ'),
                    onTap: () {
                      Navigator.of(context).pop();
                      cameraOnPressed();
                    }),
                ListTile(
                  leading: Icon(Icons.image),
                  title: Text('ຄັງຮູບພາບ'),
                  onTap: () {
                    Navigator.of(context).pop();
                    galleryOnPressed();
                  },
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: MaterialButton(
                    child: Text('ຍົກເລີກ'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
