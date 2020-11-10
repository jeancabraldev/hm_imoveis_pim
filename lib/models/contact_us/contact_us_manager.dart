import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hm_imoveis_pim/helpers/firebase_erros.dart';
import 'package:hm_imoveis_pim/models/contact_us/contact_us.dart';

class ContactUsManager extends ChangeNotifier {
  ContactUs contactUs;

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> saveContact(
      {ContactUs contactUs, Function onSuccess, Function onFail}) async {
    loading = true;

    try {
      await contactUs.saveData();
      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
    loading = false;
  }
}
