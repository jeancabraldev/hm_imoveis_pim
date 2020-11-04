import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hm_imoveis_pim/models/properties/properties.dart';

class PropertiesManager extends ChangeNotifier {
  PropertiesManager() {
    _loadAllProperties();
  }

  final Firestore firestore = Firestore.instance;

  List<Properties> allProperties = [];

  String _search = '';

  String get search => _search;

  set search(String value) {
    _search = value;
    notifyListeners();
  }

  //Filtrando imóveis
  List<Properties> get filteredProperties {
    final List<Properties> filteredProperties = [];

    if (search.isEmpty) {
      //Se a pesquisa estiver vazia todos os produtos serão adicionados a lista
      filteredProperties.addAll(allProperties);
    } else {
      //Exibindo um imóvel pelo título
      filteredProperties.addAll(
        allProperties.where(
          (p) => p.title.toLowerCase().contains(search.toLowerCase()),
        ),
      );
    }
    return filteredProperties;
  }

  //Carregando imóveis
  Future<void> _loadAllProperties() async {
    final QuerySnapshot snapshot =
        await firestore.collection('properties').getDocuments();

    //Recuperando todos os imóveis e tranformando em uma lista de imóveis
    allProperties =
        snapshot.documents.map((d) => Properties.fromDocument(d)).toList();

    notifyListeners();
  }
}
