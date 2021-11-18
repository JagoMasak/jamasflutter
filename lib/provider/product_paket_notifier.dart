import 'package:flutter/cupertino.dart';
import 'package:jamas_project/data/models/product_paket.dart';
import 'package:jamas_project/data/service_api.dart';

enum StateResult {
  Loading,NoData,HasData,Error
} 

class ListProdukPaketProvider extends ChangeNotifier{
  final ServiceApi serviceApiList;
  ListProdukPaketProvider({required this.serviceApiList}) {
    fetchAllProdukPaket();
  }
  ProdukPaket? _paket;
  String _message = "";
  StateResult? _stateResult;
  String get message => _message;
  ProdukPaket? get result => _paket;
  StateResult? get state => _stateResult;
  Future<dynamic> fetchAllProdukPaket() async{
    try {
      _stateResult = StateResult.Loading;
      notifyListeners();
      final dataProduk = await serviceApiList.listDataProdukPaket();
      if (dataProduk.data.isEmpty) {
        _stateResult = StateResult.NoData;
        notifyListeners();
        return _message = "produk tidak di temukan";
      } else {
        _stateResult = StateResult.HasData;
        notifyListeners();
        return _paket = dataProduk;
      }
    } catch (e) {
      _stateResult = StateResult.Error;
      notifyListeners();
      return _message = "sepertinya ada problem";
    }
  }
}