import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jamas_project/buttom_nav_bar.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   _duration() {
    var duration = Duration(seconds: 3);
    return Timer(duration, _introApp);
  }
  void _introApp() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ButtomNavbar()));
  }
  @override
  void initState() {
    _duration();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/jamas.png"),
                    ),
                  ),
                ),
              ),
              // Column(
              //   children: <Widget>[
              //     // the login button
              //     MaterialButton(
              //       minWidth: double.infinity,
              //       height: 60,
              //       onPressed: () {
              //         Navigator.push(context,
              //             MaterialPageRoute(builder: (context) => LoginPage()));
              //       },
              //       // defening the shape
              //       color: Color(0xffFF9800),
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(50)),
              //       child: Text(
              //         "Masuk",
              //         style:
              //             TextStyle(
              //               fontWeight: FontWeight.w600, 
              //               fontSize: 18, 
              //               color: Colors.white, 
              //               fontFamily: "Poppins"),
              //       ),
              //     ),
              //     // creating the singup button
              //     SizedBox(height: 20),
              //     MaterialButton(
              //       minWidth: double.infinity,
              //       height: 60,
              //       onPressed: () {
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) => SingUpPage()));
              //       },
              //       shape: RoundedRectangleBorder(
              //           side: BorderSide(color: Colors.black),
              //           borderRadius: BorderRadius.circular(50)),
              //       child: Text(
              //         "Daftar",
              //         style:
              //           TextStyle(
              //             fontWeight: FontWeight.w600, 
              //             fontSize: 18,
              //             fontFamily: "Poppins"
              //         ),
              //       ),
              //     )
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
