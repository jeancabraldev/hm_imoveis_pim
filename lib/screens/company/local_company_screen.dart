import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hm_imoveis_pim/components/card/card_widget.dart';
import 'package:hm_imoveis_pim/components/drawer/drawer_widget.dart';

class LocalCompanyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text(
          'Localização',
          style: GoogleFonts.montserrat(),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: CardWidget(
          pathImage: 'assets/images/store_local.jpg',
          address: 'Av Presidente Vargas, 2073',
          city: 'Ribeirânia, Ribeirão Preto - SP',
          hour1: 'Seg-Sex: 8h00 - 18h00',
          hour2: 'Sab: 8h00 - 15h00',
        ),
      ),
    );
  }
}
