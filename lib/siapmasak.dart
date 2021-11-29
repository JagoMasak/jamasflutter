import 'package:flutter/material.dart';
import 'package:jamas_project/detail.dart';
import 'package:jamas_project/provider/product_paket_notifier.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import 'data/service_api.dart';

class SiapMasak extends StatelessWidget {
  Widget _produkPaketListBuild() {
    return ChangeNotifierProvider<ListProdukPaketProvider>(
      create: (_) => ListProdukPaketProvider(serviceApiList: ServiceApi()),
      child: Consumer<ListProdukPaketProvider>(
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
                        var dataProdukPaket = state.result!.data[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPages(
                                          gambar: dataProdukPaket.images,
                                          judul: dataProdukPaket.namaProduk,
                                          keterangan: dataProdukPaket.deskripsi,
                                          harga: dataProdukPaket.harga,
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
                                    "http://jamas.dedekj.site/assets/img/${dataProdukPaket.images}",
                                    height: 89,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        dataProdukPaket.namaProduk,
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
                                        dataProdukPaket.namaMitra,
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
                                        "Rp." + dataProdukPaket.harga,
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
                      size: 40,
                    ))),
            Padding(
              padding: EdgeInsets.only(right: 30, top: 36),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Paket Siap Masak",
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

          _produkPaketListBuild()
          //  Item Produk Terlaris Jamas
        ],
      ),
    ));
  }
}
