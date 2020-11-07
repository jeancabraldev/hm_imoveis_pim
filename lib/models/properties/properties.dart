import 'package:cloud_firestore/cloud_firestore.dart';

class Properties {
  Properties.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    title = document['title'] as String;
    description = document['description'] as String;
    price = document['price'] as int;
    thenBitcoin = document['then_bitcoin'] as String;
    city = document['city'] as String;
    district = document['district'] as String;
    address = document['address'] as String;
    numberAddress = document['number_address'] as String;
    type = document['type'] as String;
    state = document['state'] as String;
    footage = document['footage'] as String;
    dormitories = document['dormitories'] as String;
    wc = document['wc'] as String;
    garage = document['garage'] as String;
    images = List<String>.from(document.data['images'] as List<dynamic>);
  }

  String id;
  String title;
  String description;
  int price;
  String thenBitcoin;
  String city;
  String district;
  String numberAddress;
  String address;
  String type;
  String state;
  String footage;
  String dormitories;
  String wc;
  String garage;
  List<String> images;
}
