import 'package:flutter/material.dart';

class AboutJamas extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
              image: DecorationImage(
              image: AssetImage("assets/jamas.png"),fit: BoxFit.fitHeight
               ),
              ),
            ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text("Apa Itu Jamas",style: TextStyle(fontSize: 30,fontFamily: "Poppins",fontWeight: FontWeight.w600),)),
              
          Padding(
                padding: EdgeInsets.only(top: 10,left: 30,right: 30),
                child: Text("Adalah cara kami untuk memperkenalkan diri dengan ngebahas segala sesuatu mengenai JAMAS, biar temen-temen semua bisa lebih kenal dengan JAMAS.",style: TextStyle(fontSize: 14,fontFamily: "Poppins",fontWeight: FontWeight.w600),textAlign: TextAlign.center,)),

          Padding(
                padding: EdgeInsets.only(top: 10,left: 30,right: 30),
                child: Text("Kalau mau tau lebih lanjut pantengin terus Instagram kita yaa..",style: TextStyle(fontSize: 14,fontFamily: "Poppins",fontWeight: FontWeight.w600),textAlign: TextAlign.center,)),
                
              
          ],
        ),
    ),
    );
  }
}