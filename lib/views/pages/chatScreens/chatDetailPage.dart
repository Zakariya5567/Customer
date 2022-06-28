import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Models/ChatModels/chatMessageModel.dart';
import '../../../Theme/Theme.dart';

class ChatDetailPage extends StatefulWidget {
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset("assets/r_assets/images/Vector.png"),
                  // icon: Icon(
                  //   Icons.arrow_back,
                  //   color: Colors.black,
                  // ),
                ),
                SizedBox(
                  width: 2,
                ),
                Image.asset(
                  "assets/r_assets/chat_image.png",
                  height: 39,
                  width: 40,
                ),
                // CircleAvatar(
                //   backgroundImage: NetworkImage("<https://randomuser.me/api/portraits/men/5.jpg>"),
                //   maxRadius: 20,
                // ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Kriss Benwat",
                        style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(0, 0, 0, 1)),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      // Text(
                      //   "Online",
                      //   style: TextStyle(
                      //       color: Colors.grey.shade600, fontSize: 13),
                      // ),
                    ],
                  ),
                ),
                Image.asset("assets/r_assets/images/Call.png")
                // Icon(
                //   Icons.settings,
                //   color: Colors.black54,
                // ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding:
                    EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                child: Align(
                  alignment: (messages[index].messageType == "receiver"
                      ? Alignment.topLeft
                      : Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messages[index].messageType == "receiver"
                          ? Colors.grey.shade200
                          : Colors.blue[200]),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      messages[index].messageContent,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Container(
                padding: EdgeInsets.only(
                  left: 10,
                  bottom: 10,
                  top: 10,
                ),
                height: 60,
                width: double.infinity,
                // color: Colors.white,
                decoration: Constants.messagecontainerstyle(),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset("assets/r_assets/images/happy.png"),
                      // child: Container(
                      //   height: 30,
                      //   width: 30,
                      //   decoration: BoxDecoration(
                      //     color: Colors.lightBlue,
                      //     borderRadius: BorderRadius.circular(30),
                      //   ),
                      //   child: Icon(
                      //     Icons.add,
                      //     color: Colors.white,
                      //     size: 20,
                      //   ),
                      // ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Write message...",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      child: Image.asset("assets/r_assets/images/Send.png"),
                      // child: Icon(
                      //   Icons.send,
                      //   color: Colors.white,
                      //   size: 18,
                      // ),
                      backgroundColor: Colors.white,
                      elevation: 0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
