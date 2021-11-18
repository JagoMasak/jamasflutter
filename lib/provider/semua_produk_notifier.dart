import 'package:flutter/cupertino.dart';
import 'package:jamas_project/data/models/semua_produk.dart';
import 'package:jamas_project/data/service_api.dart';

enum StateResult {
  Loading,NoData,HasData,Error
} 

class ListSemuaProdukProvider extends ChangeNotifier{
  final ServiceApi serviceApiList;
  ListSemuaProdukProvider({required this.serviceApiList}) {
    fetchAllSemuaProduk();
  }
  SemuaProduk? _siap;
  String _message = "";
  StateResult? _stateResult;
  String get message => _message;
  SemuaProduk? get result => _siap;
  StateResult? get state => _stateResult;
  Future<dynamic> fetchAllSemuaProduk() async{
    try {
      _stateResult = StateResult.Loading;
      notifyListeners();
      final dataProduk = await serviceApiList.listDataSemuaProduk();
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