import 'package:cloud_firestore/cloud_firestore.dart';

class Interest {
  String code;
  String name;
  String email;
  String message;

  Firestore firestore = Firestore.instance;

  //Salvando os dados do imóvel de interesse do usuário
  Future<void> saveData() async {
    await firestore.collection('interest').document().setData(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'email': email,
      'message': message,
    };
  }
}
