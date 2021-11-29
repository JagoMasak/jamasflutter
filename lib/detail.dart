import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
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
            "http://jamas.dedekj.site/assets/img/$gambar",
            height: 500,
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
          Padding(
              padding: EdgeInsets.only(left: 30, top: 33),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    LineIcons.arrowCircleLeft,
                    size: 40,
                    color: Colors.black,
                  ))),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              height: 400,
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
                              fontWeight: FontWeight.w600),
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "$keterangan",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 49),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Harga Produk",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600),
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
                                fontWeight: FontWeight.w700),
                          )),
                    ),
                    SizedBox(height: 20),
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
                            borderRadius: BorderRadius.circular(50)),
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
