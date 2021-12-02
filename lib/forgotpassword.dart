import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // ignore: deprecated_member_use
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
                      "Lupa Password",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                          fontFamily: "Poppins"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Silahkan Hubungi Admin Jamas...",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: "Poppins",
                          color: Colors.grey[700]),
                    ),
                  ],
                ),

                // Button Masuk
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: EdgeInsets.only(top: 30, left: 3),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {},
                      color: Colors.green[600],
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Hubungi Admin",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: "Poppins"),
                      ),
                    ),
                  ),
                ),

                // Teks Keterangan
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Note :",
                      style: TextStyle(
                          fontFamily: "Poppins", fontWeight: FontWeight.w600),
                    ),
                    Text(
                      " Admin akan Mengirim Password kamu.",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                        fontSize: 14,
                      ),
                    ),
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
