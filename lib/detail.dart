import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPages extends StatelessWidget {
  final gambar, judul, keterangan, harga;
  DetailPages(
      {required this.gambar,
      required this.judul,
      required this.keterangan,
      required this.harga});

  _openWA(String judul, String keterangan, String harga) async {
    String urlWA =
        "https://wa.me/+6285384045103?text=Hallo, Saya Mau Pesan Produk :" +
            "\n\n*Informasi Produk*" +
            "\n*~* Nama Produk : $judul" +
            "\n*~* Keterangan : $keterangan" +
            "\n*~* Harga : $harga";
    var encoded = Uri.encodeFull(urlWA);
    if (await canLaunch(encoded)) {
      await launch(encoded);
    } else {
      throw encoded.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            "$gambar",
            height: 372,
            width: double.maxFinite,
            fit: BoxFit.fitHeight,
          ),
          Padding(
              padding: EdgeInsets.only(left: 40, top: 40),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Iconsax.arrow_left_15,
                    size: 40,
                    color: Colors.black
                  ))),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              height: 456,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(top: 42, left: 33),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "$judul",
                          style: TextStyle(
                              fontSize: 27,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w800),
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: EdgeInsets.only(right: 20),
                            width: 400,
                            child: Text(
                              "$keterangan",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              maxLines: 5,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Poppins",
                                  ),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Harga Produk",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w700),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Rp. $harga",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                    SizedBox(height: 70),
                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 60),
                      child: MaterialButton(
                        height: 60,
                        minWidth: double.infinity,
                        color: Colors.green[600],
                        onPressed: () {
                          _openWA(judul, keterangan, harga);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          "Pesan Sekarang",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
