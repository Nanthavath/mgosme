import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mgosme/models/post_model.dart';
import 'package:mgosme/utilities/alert_dialog.dart';

import 'widgets/custom_text_field_input.dart';
import 'widgets/maps.dart';

PostModel _postModel = PostModel();

class CreateJob extends StatefulWidget {
  @override
  _CreateJobState createState() => _CreateJobState();
}

class _CreateJobState extends State<CreateJob> {
  List<String> jobType = [];
  String dropdownValue;

  ///TextController
  TextEditingController titleController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  File imgFile;
  final picker = ImagePicker();

  @override
  void initState() {
    setState(() {
      getJobType();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dateController.text =
        '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ປະກາດ'),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    buildJobTypeDropdown(),
                    CustomTextInput(
                      hintText: 'ຫົວຂໍ້ວຽກ',
                      controller: titleController,
                    ),
                    CustomTextInput(
                      keyboardType: TextInputType.number,
                      hintText: 'ງົບປະມານ',
                      controller: costController,
                    ),
                    CustomTextInput(
                      icon: Icons.location_on,
                      hintText: 'ທີ່ຢູ່',
                      controller: addressController,
                      readOnly: true,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Maps(_postModel.lat,_postModel.lng),
                        ));
                      },
                    ),

                    CustomTextInput(
                      hintText: 'ວັນທີ',
                      controller: dateController,
                      readOnly: true,
                    ),
                    CustomTextInput(
                      hintText: 'ລາຍລະອຽດວຽກ',
                      controller: detailController,
                    ),
                    Container(
                      height: 200,
                      color: Colors.grey[200],
                      child: Center(
                        child: imgFile == null
                            ? Icon(
                                Icons.image_rounded,
                                color: Colors.grey,
                              )
                            : Image.file(imgFile),
                      ),
                    ),
                    // buildJobTitle(),
                  ],
                ),
              ),
            ),
            Container(
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: buildChooseImageButton()),
                  Expanded(child: buildPostButton()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildChooseImageButton() {
    return Container(
      child: RaisedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Icon(Icons.camera_alt_outlined), Text('ເພີ່ມຮູບ')],
        ),
        onPressed: () {
          _buildShowDialog();
        },
      ),
    );
  }

  Widget buildPostButton() {
    return Container(
      child: RaisedButton(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.campaign,
              color: Colors.white,
            ),
            Text(
              'ປະກາດ',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        onPressed: () {
          postToStorage();
        },
      ),
    );
  }

  buildJobTypeDropdown() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Text('ປະເພດວຽກ'),
            isDense: true,
            isExpanded: true,
            itemHeight: 50.0,
            value: dropdownValue,
            iconSize: 24,
            elevation: 16,
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: jobType.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  void _buildShowDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('ເລືອກ'),
          content: Container(
            height: 100,
            child: Column(
              children: [
                optionButton(
                    icon: Icons.camera_alt,
                    text: 'Camera',
                    onPress: () {
                      getImage(source: ImageSource.camera).then(
                        (value) => Navigator.of(context).pop(),
                      );
                    }),
                optionButton(
                    icon: Icons.image,
                    text: 'Gallery',
                    onPress: () {
                      getImage(source: ImageSource.gallery)
                          .then((value) => Navigator.of(context).pop());
                    }),
              ],
            ),
          ),
        );
      },
    );
  }

  optionButton({IconData icon, VoidCallback onPress, String text}) {
    return MaterialButton(
      onPressed: onPress,
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text('$text'),
          ),
        ],
      ),
    );
  }

  Future getImage({ImageSource source}) async {
    final image = await picker.getImage(source: source);
    if (image != null) {
      setState(() {
        imgFile = File(image.path);
      });
    }
  }

  void postToStorage() {
    _postModel.jobType = dropdownValue;
    _postModel.title = titleController.text;
    _postModel.cost = costController.text;
    _postModel.date = dateController.text;
    _postModel.detail = detailController.text;
    _postModel.getCurrentUser().then((value) {
      _postModel.userID = value.uid;
      if (imgFile == null) {
        _postModel.postJob();
      } else {
        _postModel.addImageToFireStore(imgFile).then(
          (url) {
            _postModel.img = url;
            _postModel.postJob().then(
                  (value) => CustomAlertDialog().loadingDialog(context),
                );
          },
        );
      }
    });
  }

  Future getJobType() async {
    await FirebaseFirestore.instance.collection('jobType').get().then(
      (QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach(
          (doc) {
            print(doc['name']);
            jobType.add(doc['name']);
          },
        );
        setState(() {});
      },
    );
    print(jobType);
  }
}
