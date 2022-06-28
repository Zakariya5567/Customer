
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Theme/Theme.dart';
import '../../../utills/Displaywidth.dart';

class CustomerWallet extends StatefulWidget {
  const CustomerWallet({Key key}) : super(key: key);

  @override
  _CustomerWalletState createState() => _CustomerWalletState();
}

class _CustomerWalletState extends State<CustomerWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Container(
                height: displayHeight(context) / 10,
                width: displayWidth(context) / 1.2,
                decoration: Constants.containerstyle(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Available Balance",
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Colors.black,
                        ))),
                    SizedBox(
                      width: 20,
                    ),
                    Text("\$256.0",
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Colors.red,
                        )))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                height: displayHeight(context) / 5,
                width: displayWidth(context) / 1.2,
                decoration: Constants.containerstyle(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("TopUp"),
                        Text("Scan"),
                        Text("Pay"),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Transfer"),
                        Text("Withdraw"),
                        Text("Request"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
