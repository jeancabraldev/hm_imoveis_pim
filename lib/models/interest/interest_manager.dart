import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hm_imoveis_pim/helpers/firebase_erros.dart';
import 'package:hm_imoveis_pim/models/interest/interest.dart';

class InterestManager extends ChangeNotifier {
  Interest interest;

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  //Salvando informações no Firebase
  Future<void> saveInterest(
      {Interest interest, Function onSuccess, Function onFail}) async {
    loading = true;
    try {
      await interest.saveData();
      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
    loading = false;
  }
}
