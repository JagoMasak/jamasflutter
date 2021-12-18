import 'package:flutter/material.dart';
import 'package:jamas_project/detail.dart';
import 'package:jamas_project/provider/semua_produk_notifier.dart';
import 'package:jamas_project/search.dart';
import 'package:provider/provider.dart';

import 'data/service_api.dart';

class Explore extends StatelessWidget {
  Widget _produkSemuaListBuild() {
    return ChangeNotifierProvider<ListSemuaProdukProvider>(
      create: (_) => ListSemuaProdukProvider(serviceApiList: ServiceApi()),
      child: Consumer<ListSemuaProdukProvider>(
        builder: (context, state, _) {
          if (state.state == StateResult.Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.state == StateResult.HasData) {
            return Flexible(
              child: Container(
                  height: MediaQuery.of(context).size.height,
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
                                          gambar: dataSemuaProduk.gambar[0].url,
                                          judul: dataSemuaProduk.nama,
                                          keterangan: dataSemuaProduk.deskripsi,
                                          harga: dataSemuaProduk.harga,
                                        )));

                            // Navigator.push(context,
                            // MaterialPageRoute(builder: (context) => DetailPages()));
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
                                    dataSemuaProduk.gambar[0].url,
                                    height: 89,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        dataSemuaProduk.nama,
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
                                        dataSemuaProduk.penjual,
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
                      })),
            );
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Column(
                children: [
                  // Kolom Search Jamas
                  SizedBox(
                    height: 40,
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
                                    color: Color(0xff808080).withOpacity(0.15))
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
                                        builder: (context) => SearchProduct()));
                              },
                            ),
                          ))),

                  Flexible(
                    child: Column(
                      children: [
                        // Teks Produk Terlaris Jamas
                        Flexible(
                          child: Container(
                            child: Column(children: [
                              Padding(
                                padding: EdgeInsets.only(left: 30, top: 26),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Explore Semua Produk",
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

                              _produkSemuaListBuild()
                            ]),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
