import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditJob extends StatefulWidget {
  final String postId;

  const EditJob({Key key, this.postId}) : super(key: key);
  @override
  _EditJobState createState() => _EditJobState(postId);
}

class _EditJobState extends State<EditJob> {
  final String postId;
  _EditJobState(this.postId);

  List<String> jobType = ['Computer', 'Accountance'];
  String valueChange;

  TextEditingController titleController = TextEditingController();



  @override
  void initState() {
    valueChange = 'Computer';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          _buildJobType(),
          _buildTitle(),
        ],
      ),
    );
  }
  _buildJobType() {
    return Container(
      child: Row(
        children: [
          Text('ປະເພດວຽກ:'),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: DropdownButton<String>(
              value: valueChange,
              onChanged: (value) {
                setState(() {
                  valueChange = value;
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
        ],
      ),
    );
  }

  _buildTitle() {
    return Card(
      child: Container(
        padding: EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Text('ຫົວຂໍ້:'),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: _buildInputText(
                controller: titleController,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildInputText({TextEditingController controller}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          isDense: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          )),
    );
  }

  Future getPostInfo()async {
    DocumentSnapshot snapshot=await FirebaseFirestore.instance.collection('posts').doc(postId).get();
  }
}
