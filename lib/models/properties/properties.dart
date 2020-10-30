import 'package:cloud_firestore/cloud_firestore.dart';

class Properties {
  Properties.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    title = document['title'] as String;
    description = document['description'] as String;
    price = document['price'] as int;
    thenBitcoin = document['then_bitcoin'] as int;
    city = document['city'] as String;
    district = document['district'] as String;
    address = document['address'] as String;
    numberAddress = document['number_address'] as String;
    type = document['type'] as String;
    state = document['state'] as String;
    images = List<String>.from(document.data['images'] as List<dynamic>);
  }

  String id;
  String title;
  String description;
  int price;
  int thenBitcoin;
  String city;
  String district;
  String numberAddress;
  String address;
  String type;
  String state;
  List<String> images;
}
