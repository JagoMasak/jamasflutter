import 'package:flutter/cupertino.dart';
import 'package:jamas_project/data/models/search_product.dart';
import 'package:jamas_project/data/service_api.dart';

enum StateResult {
  Loading,NoData,HasData,Error
} 

class ListCariProdukProvider extends ChangeNotifier{
  final ServiceApi serviceApiList;
  ListCariProdukProvider({required this.serviceApiList}) {
    fetchCariProduk(query);
  }
  CariProduk? _cariProduk;
  String _message = "";
  String _query = "";
  StateResult? _stateResult;
  String get message => _message;
  String get query => _query;
  CariProduk? get result => _cariProduk;
  StateResult? get state => _stateResult;
  Future<dynamic> fetchCariProduk(String query) async{
    try {
      _stateResult = StateResult.Loading;
      _query = query;
      final dataProduk = await serviceApiList.listCariProduk(query);
      if (dataProduk.data.isEmpty) {
        _stateResult = StateResult.NoData;
        notifyListeners();
        return _message = "produk tidak di temukan";
      } else {
        _stateResult = StateResult.HasData;
        notifyListeners();
        return _cariProduk = dataProduk;
      }
    } catch (e) {
      _stateResult = StateResult.Error;
      notifyListeners();
      return _message = "sepertinya ada problem";
    }
  }
}