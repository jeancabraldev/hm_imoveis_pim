import 'package:cloud_firestore/cloud_firestore.dart';

class Launch {
  Launch.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    code = document['code'] as String;
    title = document['title'] as String;
    description = document['description'] as String;
    price = document['price'] as int;
    thenBitcoin = document['then_bitcoin'] as String;
    city = document['city'] as String;
    district = document['district'] as String;
    numberAddress = document['number_address'] as String;
    address = document['address'] as String;
    type = document['type'] as String;
    situation = document['situation'] as String;
    state = document['state'] as String;
    garage = document['garage'] as String;
    wc = document['wc'] as String;
    footage = document['footage'] as String;
    dormitories = document['dormitories'] as String;
    images = List.from(document.data['images'] as List<dynamic>);
  }

  String id;
  String code;
  String title;
  String description;
  int price;
  String thenBitcoin;
  String city;
  String district;
  String numberAddress;
  String address;
  String type;
  String situation;
  String state;
  String garage;
  String wc;
  String footage;
  String dormitories;
  List<String> images;
}
