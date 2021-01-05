import 'package:flutter/material.dart';

class ListInfo extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  ListInfo({this.icon, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.black,
              size: 20,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              height: 60,
              // padding: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey,width: 0.5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  InkWell(
                    child: Icon(
                      Icons.edit_outlined,
                      color: Colors.grey,
                      size: 18,
                    ),
                    onTap: onTap,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
