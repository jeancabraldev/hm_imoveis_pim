import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hm_imoveis_pim/screens/home/home_screen.dart';
import 'package:hm_imoveis_pim/utils/colors_app.dart';

void main() {
  runApp(MyApp());

  Firestore.instance.collection('teste').add({'teste': 'teste'});
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HM Imóveis',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorsApp.primaryColor(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
