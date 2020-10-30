import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hm_imoveis_pim/models/properties/properties.dart';

class PropertiesManager extends ChangeNotifier {
  PropertiesManager() {
    _loadAllProperties();
  }

  final Firestore firestore = Firestore.instance;

  List<Properties> allProperties = [];

  Future<void> _loadAllProperties() async {
    final QuerySnapshot snapshot =
        await firestore.collection('properties').getDocuments();

    //Recuperando todos os imóveis e tranformando em uma lista de imóveis
    allProperties =
        snapshot.documents.map((d) => Properties.fromDocument(d)).toList();

    notifyListeners();
  }
}
