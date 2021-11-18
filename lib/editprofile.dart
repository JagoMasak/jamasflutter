import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
// Future pickImage() async {
//   await ImagePicker().pickImage();
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                  padding: EdgeInsets.only(left: 30, top: 33),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ))),
              Padding(
                padding: EdgeInsets.only(right: 30, top: 36),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Edit Profile Akun",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: ("Poppins"),
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ),
            ]),
            SizedBox(
              height: 128,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/azzam.png"),
                    fit: BoxFit.fitHeight),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.only(left: 92, right: 92),
              child: MaterialButton(
                height: 50,
                minWidth: double.infinity,
                color: Color(0xffFF9800),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  "Edit Foto",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(50),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(50)),
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan Nama',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: MaterialButton(
                height: 50,
                minWidth: double.infinity,
                color: Color(0xffFF9800),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  "Simpan Sekarang",
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
