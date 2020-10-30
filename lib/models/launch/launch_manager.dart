import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hm_imoveis_pim/models/launch/launch.dart';

class LaunchManager extends ChangeNotifier {
  LaunchManager() {
    _loadAllLaunch();
  }

  final Firestore firestore = Firestore.instance;

  List<Launch> allLaunchs = [];

  Future<void> _loadAllLaunch() async {
    final QuerySnapshot snapshot =
        await firestore.collection('launch').getDocuments();

    //Recuperando todos os lançamentos e tranformando em uma lista de lançamentos
    allLaunchs = snapshot.documents.map((d) => Launch.fromDocument(d)).toList();

    notifyListeners();
  }
}
