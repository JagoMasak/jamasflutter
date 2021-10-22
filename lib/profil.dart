import 'package:flutter/material.dart';
import 'package:jamas_project/editprofile.dart';
import 'package:jamas_project/main.dart';

class Profil extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
            child: 
                Column(
                  children: [
             
                    SizedBox(
                      height: 40,
                    ),
                  
                         // Teks Profil
                          Container(
                            child: Column(
                              children:[ Padding(
                              padding: EdgeInsets.only(
                                left: 30,
                                top: 26
                                ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: 
                                Text(
                                  "Profil",
                                    style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: ("Poppins"),
                                    fontWeight: FontWeight.w600, 
                                    color: Colors.black),
                                  ),
                                ),
                              ),
                              Padding(
                              padding: EdgeInsets.only(
                                left: 30,
                                top: 6
                                ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: 
                                Text(
                                  "Comming Soon...",
                                    style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: ("Poppins"),
                                    fontWeight: FontWeight.w600, 
                                    color: Colors.black),
                                  ),
                                ),
                              ),
          
                              SizedBox(
                                height: 20,
                              ),
      
                              Container(
                                height: MediaQuery.of(context).size.height / 4,
                                decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage("assets/azzam.png"),fit: BoxFit.fitHeight
                              ),
                            ),
                          ),

                      // Button Edit Profile
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal:40),
                        child:Container(
                        padding: EdgeInsets.only(top: 30, left: 3),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context) => EditProfile()));
                          },
                          color: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            "Edit Profile",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: "Poppins"
                              ),
                            ),
                          ),
                        ),
                      ),
                    
                    // Button Keluar
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal:40),
                      child:Container(
                        padding: EdgeInsets.only(top: 30, left: 3),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomePage()));
                          },
                          color: Color(0xffFF9800),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            "Keluar",
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
           
                  ]
                ),
              ),
             ],
            ),

          ),
        ),
      )
    );
  }
}
