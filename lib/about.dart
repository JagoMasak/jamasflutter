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
                      image: AssetImage("assets/jamas.png"),
                      fit: BoxFit.fitHeight),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Apa Itu Jamas",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      color: Color(0xffFF9800)),
                )),
                SizedBox(
                  height: 10,
                ),
            Container(
              height: 80,
              width: 350,
              color: Colors.white,
              child: Text(
                'Sebuah platfrom berbasis android yang membahas mengenai kebutuhan ibu rumah tangga',
                maxLines: 3,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 15,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w100
                  ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20,left: 80, right: 80),
              child: MaterialButton(
                          height: 50,
                          minWidth: double.infinity,
                          color: Color(0xffFF9800),
                          onPressed: () {
                            
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            "Info Lebih Lanjut",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
