import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jamas_project/detail.dart';
import 'package:jamas_project/provider/semua_produk_notifier.dart';
import 'package:jamas_project/search.dart';
import 'package:jamas_project/siapmasak.dart';
import 'package:jamas_project/sipasaji.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  Widget _produkTerlarisListBuild() {
    return Consumer<ListSemuaProdukProvider>(
      builder: (context, state, _) {
        if (state.state == StateResult.Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.state == StateResult.HasData) {
          return Flexible(
              child: Container(
                  height: double.maxFinite,
                  child: GridView.builder(
                      itemCount: state.result!.data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        var dataSemuaProduk = state.result!.data[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPages(
                                          gambar: dataSemuaProduk.images,
                                          judul: dataSemuaProduk.namaProduk,
                                          keterangan: dataSemuaProduk.deskripsi,
                                          harga: dataSemuaProduk.harga,
                                        )));
                          },
                          child: Container(
                              margin: EdgeInsets.only(
                                  bottom: 20, right: 10, left: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 5),
                                      blurRadius: 5,
                                      color:
                                          Color(0xff808080).withOpacity(0.10))
                                ],
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Image.network(
                                    "http://jamas.dedekj.site/assets/img/${dataSemuaProduk.images}",
                                    height: 89,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        dataSemuaProduk.namaProduk,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        dataSemuaProduk.namaMitra,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w200),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "Rp." + dataSemuaProduk.harga,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w200),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        );
                      })));
        } else if (state.state == StateResult.NoData) {
          return Center(
            child: Text("sepertinya tidak ada data"),
          );
        } else if (state.state == StateResult.Error) {
          return Center(
            child: Text("sepertinya ada masalah"),
          );
        } else {
          return Center(
            child: Text("no coment"),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              // Box Orange Atas
              Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: 204,
                        width: double.maxFinite,
                        decoration: const BoxDecoration(
                            color: Color(0xffFF9800),
                            image: DecorationImage(
                                image: AssetImage("assets/banner1.png"),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                ],
              ),

              Container(
                height: 950,
                child: Column(
                  children: [
                    // Kolom Search Jamas
                    SizedBox(
                      height: 180,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Container(
                            width: 320,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 4),
                                      blurRadius: 4,
                                      color:
                                          Color(0xff808080).withOpacity(0.15))
                                ],
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                border: Border.all(
                                    width: 1,
                                    color: Colors.black.withOpacity(0.3))),
                            child: ListTile(
                              title: TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                    hintText: "Bingung Mau Masak Apa ?",
                                    icon: Icon(
                                Icons.search,
                                size: 24,
                                color: Colors.black,
                              ),
                                    border: InputBorder.none),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SearchProduct()));
                                },
                              ),
                            ))),

                    Flexible(
                      child: Container(
                        child: Column(
                          children: [
                            //Teks Kategori
                            Padding(
                              padding: EdgeInsets.only(left: 30, top: 17),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Kategori",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: ("Poppins"),
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffFF9800)),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 15,
                            ),
                            // Gambar dan teks paket Jamas
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 32),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SiapMasak()));
                                      },
                                      child: Column(
                                        children: [
                                          Image.asset("assets/Group 45.png",
                                              width: 168, height: 87),
                                          Text(
                                            "Paket Siap Masak",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: ("Poppins"),
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 17,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SiapSaji()));
                                      },
                                      child: Column(
                                        children: [
                                          Image.asset("assets/Group 46.png",
                                              width: 168, height: 87),
                                          Text(
                                            "Paket Siap Saji",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: ("Poppins"),
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Teks Produk Terlaris Jamas
                            Expanded(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 1.3,
                                child: Column(children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 30, top: 26),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Produk Terlaris Jamas",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontFamily: ("Poppins"),
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffFF9800)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  //  Item Produk Terlaris Jamas
                                  _produkTerlarisListBuild(),
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
