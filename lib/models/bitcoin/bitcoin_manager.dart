import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class BitcoinManager extends ChangeNotifier {
  String price = '0';

  //Recuperando o valor de venda do Bitcoin
  Future<void> showPrice() async {
    const String url = 'https://blockchain.info/ticker';

    final http.Response response = await http.get(url);

    final Map<String, dynamic> toMap =
        json.decode(response.body) as Map<String, dynamic>;

    price = toMap["BRL"]["buy"].toString();

    notifyListeners();
  }
}
