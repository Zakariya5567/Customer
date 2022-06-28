import 'package:customer/views/pages/chatScreens/ChatPage.dart';
import 'package:customer/views/widgets/r_tab_bar_view.dart';
import 'package:flutter/material.dart';

class ChatMainScreen extends StatefulWidget {
  const ChatMainScreen({Key key}) : super(key: key);

  @override
  _ChatMainScreenState createState() => _ChatMainScreenState();
}

class _ChatMainScreenState extends State<ChatMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ChatPage(), bottomNavigationBar: R_TabBarViewData());
  }
}
