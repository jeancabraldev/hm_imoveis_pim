import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hm_imoveis_pim/components/drawer/drawer_widget.dart';
import 'package:hm_imoveis_pim/components/info/info_text_widget.dart';
import 'package:hm_imoveis_pim/screens/about_us/information_about_us.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final InformationAboutUs _informationAboutUs = InformationAboutUs();
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text(
          'Sobre Nós',
          style: GoogleFonts.montserrat(),
        ),
        centerTitle: true,
      ),
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                InfoTextWidget(
                  title: 'HM Imóveis',
                  description: _informationAboutUs.text1,
                ),
                InfoTextWidget(
                  title: 'Blockchain',
                  description: _informationAboutUs.text2,
                ),
                InfoTextWidget(
                  title: 'LGPD',
                  description: _informationAboutUs.text3,
                ),
                InfoTextWidget(
                  title: 'Bitcoins',
                  description: _informationAboutUs.text4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
