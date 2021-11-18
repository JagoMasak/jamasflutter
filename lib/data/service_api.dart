import 'dart:convert';

import 'package:jamas_project/data/models/product_paket.dart';
import 'package:http/http.dart' as http;
import 'package:jamas_project/data/models/product_siap.dart';
import 'package:jamas_project/data/models/search_product.dart';
import 'package:jamas_project/data/models/semua_produk.dart';

class ServiceApi {
  static final String _baseUrl = "192.168.33.37/jamasCI/api/";

  Future <ProdukPaket> listDataProdukPaket() async{
    final response = await http.get(Uri.parse(_baseUrl + "produk/jenis?JAGOMASAK-KEY=jamas123&id_jenis=2"));
    if (response.statusCode == 200){
      return ProdukPaket.fromJson(json.decode(response.body));
    }
    else {
      throw Exception("gagal mendapatkan produk");
    }
  }
  Future <ProdukSiap> listDataProdukSiap() async{
    final response = await http.get(Uri.parse(_baseUrl + "produk/jenis?JAGOMASAK-KEY=jamas123&id_jenis=1"));
    if (response.statusCode == 200){
      return ProdukSiap.fromJson(json.decode(response.body));
    }
    else {
      throw Exception("gagal mendapatkan produk");
    }
  }
  Future <SemuaProduk> listDataSemuaProduk() async{
    final response = await http.get(Uri.parse(_baseUrl + "produk?JAGOMASAK-KEY=jamas123"));
    if (response.statusCode == 200){
      return SemuaProduk.fromJson(json.decode(response.body));
    }
    else {
      throw Exception("gagal mendapatkan produk");
    }
  }
  Future <CariProduk> listCariProduk(String query) async{
    final response = await http.get(Uri.parse(_baseUrl + "produk/cari?JAGOMASAK-KEY=jamas123&keyword=$query"));
    if (response.statusCode == 200){
      return CariProduk.fromJson(json.decode(response.body));
    }
    else {
      throw Exception("gagal mendapatkan produk");
    }
  }
}