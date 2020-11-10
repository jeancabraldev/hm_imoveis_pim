import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  User({this.email, this.password, this.name, this.id});

  User.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    name = document.data['name'] as String;
    email = document.data['email'] as String;
  }

  String id;
  String name;
  String email;
  String password;
  String confirmPassword;

  Firestore firestore = Firestore.instance;

  DocumentReference get firestoreReference => firestore.document('users/$id');

  //Salvando dados do usuário
  Future<void> saveData() async {
    await firestoreReference.setData(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }
}
