import 'package:flutter/material.dart';

class R_TabBarViewData extends StatefulWidget {
  const R_TabBarViewData({Key key}) : super(key: key);

  @override
  _R_TabBarViewDataState createState() => _R_TabBarViewDataState();
}

class _R_TabBarViewDataState extends State<R_TabBarViewData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedIconTheme: IconThemeData(
            color: Colors.black,
          ),
          unselectedItemColor: Colors.deepOrangeAccent,
          items: const <BottomNavigationBarItem>[
            // BottomNavigationBarItem(
            //   icon: ImageIcon(
            //     AssetImage("assets/images/Home.png"),
            //     color: Colors.red,
            //   ),
            //   label: '',
            // ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/r_assets/images/Wallet.png"),
                color: Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/r_assets/images/foodimages/timeicon.png"),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/r_assets/images/Chat.png"),
                color: Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/r_assets/images/Setting.png"),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
