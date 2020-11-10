import 'package:cloud_firestore/cloud_firestore.dart';

class ContactUs {
  ContactUs({
    this.name,
    this.email,
    this.message,
  });

  ContactUs.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    name = document['name'] as String;
    email = document['email'] as String;
    message = document['message'] as String;
  }

  Firestore firestore = Firestore.instance;

  String id;
  String name;
  String email;
  String message;

  //Salvando menssagem do usuário
  Future<void> saveData() async {
    await firestore.collection('contact').document().setData(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'message': message,
    };
  }
}
