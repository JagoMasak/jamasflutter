import 'package:flutter/material.dart';
import 'package:jamas_project/detail.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import 'data/service_api.dart';
import 'provider/product_siap_notifier.dart';

class SiapSaji extends StatelessWidget {
  Widget _produkSiapListBuild() {
    return ChangeNotifierProvider<ListProdukSiapProvider>(
      create: (_) => ListProdukSiapProvider(serviceApiList: ServiceApi()),
      child: Consumer<ListProdukSiapProvider>(
        builder: (context, state, _) {
          if (state.state == StateResult.Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.state == StateResult.HasData) {
            return Expanded(
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: GridView.builder(
                      itemCount: state.result!.data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        var dataProdukSaji = state.result!.data[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPages(
                                          gambar: dataProdukSaji.gambar,
                                          judul: dataProdukSaji.namaProduk,
                                          keterangan: dataProdukSaji.deskripsi,
                                          harga: dataProdukSaji.harga,
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
                                      offset: Offset(0, 10),
                                      blurRadius: 10,
                                      color:
                                          Color(0xff808080).withOpacity(0.15))
                                ],
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Image.network(
                                    "http://192.168.33.37/jamasCI/assets/img/${dataProdukSaji.gambar}",
                                    height: 89,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        dataProdukSaji.namaProduk,
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
                                        dataProdukSaji.namaToko,
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
                                        "Rp." + dataProdukSaji.harga,
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
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
                padding: EdgeInsets.only(left: 30, top: 33),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      LineIcons.arrowCircleLeft,
                      color: Color(0xffFF9800),
                    ))),
            Padding(
              padding: EdgeInsets.only(right: 30, top: 36),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Paket Siap Saji",
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: ("Poppins"),
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFF9800)),
                ),
              ),
            ),
          ]),
          SizedBox(
            height: 20,
          ),

          _produkSiapListBuild()
          //  Item Produk Terlaris Jamas
        ],
      ),
    ));
  }
}
