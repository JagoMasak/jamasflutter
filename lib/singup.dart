import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jamas_project/login.dart';

class SingUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // ignore: deprecated_member_use
        brightness: Brightness.light,
        backgroundColor: Colors.white,

        // Icon Button di atas
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  // Teks Buat Akun
                  Text(
                    "Buat Akun",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins"),
                  ),
                  // Teks ayo daftar sekarang
                  SizedBox(height: 20),
                  Text(
                    "Ayo daftar sekarang..",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),

              // Isi Form
              Column(
                children: <Widget>[
                  inputFile(label: "Nama"),
                  inputFile(label: "Email"),
                  inputFile(label: "Password", obscureText: true),
                ],
              ),

              // Button daftar
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {},
                  color: Color(0xffFF9800),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Daftar",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: "Poppins"),
                  ),
                ),
              ),

              // Teks keterangan di bawah
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Sudah punya Akun ?",
                    style: TextStyle(fontFamily: "Poppins"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text(
                      " Login Sekarang ",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                          fontSize: 14,
                          color: Color(0xffFF9800)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Codingan Form
Widget inputFile({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
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
              borderRadius: BorderRadius.circular(50)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(50)),
        ),
      ),
      SizedBox(height: 10)
    ],
  );
}
