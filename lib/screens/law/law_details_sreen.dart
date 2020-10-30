import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hm_imoveis_pim/components/info/info_text_widget.dart';
import 'package:hm_imoveis_pim/screens/law/information_law.dart';

class LawDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final InformationLaw _informationLaw = InformationLaw();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lei Geral de Proteção de Dados',
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              fontSize: 17,
            ),
          ),
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
                  title: 'O que significa LGPD?',
                  description: _informationLaw.text1,
                ),
                InfoTextWidget(
                  title: 'O que diz a LGPD?',
                  description: _informationLaw.text2,
                ),
                InfoTextWidget(
                  title: 'Bases legais para o tratamento de dados',
                  description: _informationLaw.text3,
                ),
                InfoTextWidget(
                  title: 'Princípios da LGPD',
                  description: _informationLaw.text4,
                ),
                InfoTextWidget(
                  title: 'Quem são os atores envolvidos?',
                  description: _informationLaw.text5,
                ),
                InfoTextWidget(
                  title: 'Por onde começar?',
                  description: _informationLaw.text6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
