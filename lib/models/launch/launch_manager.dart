import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hm_imoveis_pim/models/launch/launch.dart';

class LaunchManager extends ChangeNotifier {
  LaunchManager() {
    _loadAllLaunch();
  }

  final Firestore firestore = Firestore.instance;

  List<Launch> allLaunch = [];

  String _search = '';

  String get search => _search;

  set search(String value) {
    _search = value;
    notifyListeners();
  }

  //Filtrando lançamentos
  List<Launch> get filteredLaunch {
    final List<Launch> filteredLaunch = [];

    if (search.isEmpty) {
      //Se a pesquisa estiver vazia todos os produtos serão adicionados a lista
      filteredLaunch.addAll(allLaunch);
    } else {
      //Exibindo um imóvel pelo título
      filteredLaunch.addAll(
        allLaunch.where(
          (l) => l.title.toLowerCase().contains(
                search.toLowerCase(),
              ),
        ),
      );
    }
    return filteredLaunch;
  }

  //Carregando lançamentos
  Future<void> _loadAllLaunch() async {
    final QuerySnapshot snapshot =
        await firestore.collection('launch').getDocuments();

    //Recuperando todos os lançamentos e transformando em uma lista de lançamentos
    allLaunch = snapshot.documents.map((d) => Launch.fromDocument(d)).toList();

    notifyListeners();
  }
}
