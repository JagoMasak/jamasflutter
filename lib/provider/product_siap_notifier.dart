import 'package:flutter/cupertino.dart';
import 'package:jamas_project/data/models/product_siap.dart';
import 'package:jamas_project/data/service_api.dart';

enum StateResult {
  Loading,NoData,HasData,Error
} 

class ListProdukSiapProvider extends ChangeNotifier{
  final ServiceApi serviceApiList;
  ListProdukSiapProvider({required this.serviceApiList}) {
    fetchAllProduksiap();
  }
  ProdukSiap? _siap;
  String _message = "";
  StateResult? _stateResult;
  String get message => _message;
  ProdukSiap? get result => _siap;
  StateResult? get state => _stateResult;
  Future<dynamic> fetchAllProduksiap() async{
    try {
      _stateResult = StateResult.Loading;
      notifyListeners();
      final dataProduk = await serviceApiList.listDataProdukSiap();
      if (dataProduk.data.isEmpty) {
        _stateResult = StateResult.NoData;
        notifyListeners();
        return _message = "produk tidak di temukan";
      } else {
        _stateResult = StateResult.HasData;
        notifyListeners();
        return _siap = dataProduk;
      }
    } catch (e) {
      _stateResult = StateResult.Error;
      notifyListeners();
      return _message = "sepertinya ada problem";
    }
  }
}