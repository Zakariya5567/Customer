import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../Models/ChatModels/UserchatModel.dart';
import '../../../Theme/Theme.dart';
import '../../../utills/Displaywidth.dart';
import 'conversationList.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        name: "Jane Russel",
        messageText: "Awesome Setup",
        imageURL: "images/userImage1.jpeg",
        time: "Now"),
    ChatUsers(
        name: "Glady's Murphy",
        messageText: "That's Great",
        imageURL: "images/userImage2.jpeg",
        time: "Yesterday"),
    ChatUsers(
        name: "Jorge Henry",
        messageText: "Hey where are you?",
        imageURL: "images/userImage3.jpeg",
        time: "31 Mar"),
    ChatUsers(
        name: "Philip Fox",
        messageText: "Busy! Call me in 20 mins",
        imageURL: "images/userImage4.jpeg",
        time: "28 Mar"),
    ChatUsers(
        name: "Debra Hawkins",
        messageText: "Thankyou, It's awesome",
        imageURL: "images/userImage5.jpeg",
        time: "23 Mar"),
    ChatUsers(
        name: "Jacob Pena",
        messageText: "will update you in evening",
        imageURL: "images/userImage6.jpeg",
        time: "17 Mar"),
    ChatUsers(
        name: "Andrey Jones",
        messageText: "Can you please share the file?",
        imageURL: "images/userImage7.jpeg",
        time: "24 Feb"),
    ChatUsers(
        name: "John Wick",
        messageText: "How are you?",
        imageURL: "images/userImage8.jpeg",
        time: "18 Feb"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // SafeArea(
            //   child: Padding(
            //     padding: EdgeInsets.only(left: 16, right: 16, top: 10),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: <Widget>[
            //         Text(
            //           "Conversations",
            //           style:
            //               TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            //         ),
            //         Container(
            //           padding:
            //               EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
            //           height: 30,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(30),
            //             color: Colors.pink[50],
            //           ),
            //           child: Row(
            //             children: <Widget>[
            //               Icon(
            //                 Icons.add,
            //                 color: Colors.pink,
            //                 size: 20,
            //               ),
            //               SizedBox(
            //                 width: 2,
            //               ),
            //               Text(
            //                 "Add New",
            //                 style: TextStyle(
            //                     fontSize: 14, fontWeight: FontWeight.bold),
            //               ),
            //             ],
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/r_assets/images/Menu.png"),
                  SizedBox(
                    width: displayWidth(context) * 0.30,
                  ),
                  Text(
                    "Chat",
                    style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    )),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            //search bar
            Container(
              margin: EdgeInsets.only(top: 25, left: 20),
              height: displayHeight(context) * 0.066,
              width: displayWidth(context) / 1.17,
              decoration: Constants.containerstyle(),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Image.asset("assets/r_assets/images/Search.png"),
                  // suffixIcon: Image.asset("assets/images/Filter.png"),
                  hintText: "Search",
                ),
              ),
            ),
            // Conversation List
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ConversationsList(
                  name: chatUsers[index].name,
                  messageText: chatUsers[index].messageText,
                  imageUrl: chatUsers[index].imageURL,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
