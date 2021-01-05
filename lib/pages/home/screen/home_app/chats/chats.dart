import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat_room.dart';

class Chats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ຂໍ້ຄວາມ'),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(),
                  title: Text('Name Surname'),
                  subtitle: Text('Name:Message'),
                  trailing: Text('12:00'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChatRoom(),
                    ));
                  },
                ),
                Divider(
                  thickness: 1,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
