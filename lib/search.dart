import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jamas_project/data/service_api.dart';
import 'package:jamas_project/detail.dart';
import 'package:jamas_project/provider/search_product_notifier.dart';
import 'package:provider/provider.dart';

class SearchProduct extends StatefulWidget {
  @override
  _SearchProductState createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  String _query = "";
  TextEditingController _controller = TextEditingController();
  Widget _cariProdukListBuild() {
    return ChangeNotifierProvider<ListCariProdukProvider>(
      create: (_) => ListCariProdukProvider(serviceApiList: ServiceApi()),
      child: Consumer<ListCariProdukProvider>(
        builder: (context, state, _) {
          if (state.state == StateResult.Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.state == StateResult.HasData) {
            state.fetchCariProduk(_query);
            return Flexible(
              child: ListView.builder(
                itemCount: state.result!.data.length,
                itemBuilder: (context, index) {
                  var cariProdukPaket = state.result!.data[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPages(
                                    gambar: cariProdukPaket.gambar[0].url,
                                    judul: cariProdukPaket.nama,
                                    keterangan: cariProdukPaket.deskripsi,
                                    harga: cariProdukPaket.harga,
                                  )));
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                      height: 109,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 4,
                                color: Color(0xff808080).withOpacity(0.10))
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(
                              width: 1, color: Colors.black.withOpacity(0.1))),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Image.network(
                              cariProdukPaket.gambar[0].url,
                              width: 134,
                              height: double.maxFinite,
                              fit: BoxFit.cover),
                          SizedBox(
                            width: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 13, left: 140),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      cariProdukPaket.nama,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      cariProdukPaket.penjual,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w300),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Rp. " + cariProdukPaket.harga,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w300),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state.state == StateResult.NoData) {
            state.fetchCariProduk(_query);
            return Center(
              child: Text("sepertinya tidak ada data"),
            );
          } else if (state.state == StateResult.Error) {
            state.fetchCariProduk(_query);
            return Center(
              child: Text("produk tidak ditemukan"),
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 1.1,
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
                padding: EdgeInsets.only(left: 40, top: 33),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Iconsax.arrow_left_15,
                        color: Color(0xffFF9800), size: 40))),
            Padding(
              padding: EdgeInsets.only(right: 30, top: 33),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Pencarian",
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
          ChangeNotifierProvider<ListCariProdukProvider>(
              create: (_) =>
                  ListCariProdukProvider(serviceApiList: ServiceApi()),
              child: Consumer<ListCariProdukProvider>(
                  builder: (context, state, _) {
                return Container(
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
                            width: 1, color: Colors.black.withOpacity(0.3))),
                    child: ListTile(
                      title: TextField(
                        textAlign: TextAlign.start,
                        controller: _controller,
                        decoration: InputDecoration(
                            hintText: "Bingung Mau Masak Apa ?",
                            icon: Icon(
                              Icons.search,
                              size: 24,
                              color: Colors.black,
                            ),
                            contentPadding:
                                EdgeInsets.only(right: 20, left: 0.1),
                            border: InputBorder.none),
                        onChanged: (String value) {
                          setState(() {
                            _query = value;
                          });
                          if (value != "") {
                            state.fetchCariProduk(value);
                          }
                        },
                      ),
                    ));
              })),
          SizedBox(
            height: 10,
          ),
          _cariProdukListBuild()
        ]),
      ),
    )));
  }
}
