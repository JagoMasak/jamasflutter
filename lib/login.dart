import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jamas_project/buttom_nav_bar.dart';
import 'package:jamas_project/forgotpassword.dart';
import 'package:jamas_project/home.dart';
import 'package:jamas_project/singup.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_sharp,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // Teks Atas
                  Column(
                    children: <Widget>[
                      Text(
                        "Selamat Datang",
                        style:TextStyle(
                          fontWeight: FontWeight.w600, 
                          fontSize: 30, 
                          fontFamily: "Poppins"
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Login dahulu untuk melanjutkan",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: "Poppins",
                          color: Colors.grey[700]
                        ),
                      ),
                    ],
                  ),

                  // Label Form
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        inputFile(label: "Email"),
                        inputFile(label: "Password", obscureText: true),
                      ],
                    ),
                  ),

                  // Teks Lupa Password
                  Padding(
                    padding: EdgeInsets.only(left: 222),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ForgotPassword()));
                          },
                          child: Text(
                            "Lupa Password",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Color(0xffFF9800),
                              fontFamily: "Poppins"
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  // Button Masuk
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:40),
                    child:Container(
                      padding: EdgeInsets.only(top: 30, left: 3),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ButtomNavbar()));
                        },
                        color: Color(0xffFF9800),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          "Masuk",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: "Poppins"
                          ),
                        ),
                      ),
                    ),
                  ),
                
                // Teks Keterangan 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Belum punya Akun ?",
                      style: TextStyle(
                        fontFamily: "Poppins"
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SingUpPage()));
                      },
                      child: Text(
                        " Buat Sekarang",
                      style: TextStyle(
                      fontWeight: FontWeight.w600, 
                      fontFamily: "Poppins",
                      fontSize: 14,
                      color: Color(0xffFF9800)),
                      ),
                    )
                  ],
                ),
                
              ],
            ))
          ],
        ),
      ),
    );
  }
}

Widget inputFile({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
          fontSize: 15, 
          fontWeight: FontWeight.w400, 
          color: Colors.black87
        ),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(50)
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(50)
          ),
        ),
      ),
      SizedBox(
        height: 10
      )
    ],
  );
}
