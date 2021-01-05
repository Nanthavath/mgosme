import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:popup_menu/popup_menu.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  PopupMenu menu;

  @override
  void initState() {
    super.initState();


  }

  void stateChanged(bool isShow) {
    print('menu is ${isShow ? 'showing' : 'closed'}');
  }

  void onClickMenu(MenuItemProvider item) {
    print('Click menu -> ${item.menuTitle}');
  }

  void onDismiss() {
    print('Menu is dismiss');
  }

  @override
  Widget build(BuildContext context) {
    PopupMenu.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/profile.jpg'),
            ),
            SizedBox(
              width: 10,
            ),
            Text('Chiro Barcelona'),
          ],
        ),
        actions: [IconButton(icon: Icon(Icons.more_vert), onPressed: () {})],
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          child: index == 0
                              ? ChatBubble(
                                  clipper: ChatBubbleClipper1(
                                      type: BubbleType.receiverBubble),
                                  backGroundColor: Color(0xffE7E7ED),
                                  margin: EdgeInsets.only(top: 20),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.of(context).size.width *
                                              0.7,
                                    ),
                                    child: Text(
                                      'Hey! you',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                )
                              : ChatBubble(
                                  clipper: ChatBubbleClipper1(
                                      type: BubbleType.sendBubble),
                                  alignment: Alignment.topRight,
                                  margin: EdgeInsets.only(top: 20),
                                  backGroundColor: Colors.blue,
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.of(context).size.width *
                                              0.7,
                                    ),
                                    child: Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                            child: Icon(
                              Icons.attachment,
                              size: 30,
                            ),
                            onTap: () {},
                          ),
                          hintText: 'ພິມຂໍ້ຄວາມ...',
                          isDense: true,
                          contentPadding: EdgeInsets.only(
                              left: 10, top: 5, bottom: 5, right: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.white,
                              ))),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue, shape: BoxShape.circle),
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
