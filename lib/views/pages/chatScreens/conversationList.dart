import 'package:customer/views/pages/chatScreens/chatDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';


// ignore: must_be_immutable
class ConversationsList extends StatefulWidget {
  String name;
  String messageText;
  String imageUrl;
  String time;
  bool isMessageRead;
  ConversationsList(
      { this.name,
       this.messageText,
       this.imageUrl,
       this.time,
       this.isMessageRead});
  @override
  _ConversationsListState createState() => _ConversationsListState();
}

class _ConversationsListState extends State<ConversationsList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatDetailPage()),
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Image.asset("assets/r_assets/chat_image.png"),
                      // CircleAvatar(
                      //   backgroundImage: NetworkImage(widget.imageUrl),
                      //   maxRadius: 30,
                      // ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(widget.name,
                                  style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(0, 0, 0, 1)),
                                  )),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                widget.messageText,
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade600,
                                    fontWeight: widget.isMessageRead
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  widget.time,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: widget.isMessageRead
                          ? FontWeight.bold
                          : FontWeight.normal),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5),
            ),
            Container(
              margin: EdgeInsets.only(left: 5.0, right: 5.0),
              child: Divider(
                color: Color.fromRGBO(0, 0, 0, 0.3),
                thickness: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
