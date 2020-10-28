import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hm_imoveis_pim/components/info/info_text_widget.dart';
import 'package:hm_imoveis_pim/screens/bitcoin/information_bitcoins.dart';

class BitcoinDetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final InformationBitcoins _informationBitcoins = InformationBitcoins();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sobre o Bitcoin',
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
                  title: 'O que é Bitcoin?',
                  description: _informationBitcoins.text1,
                ),
                InfoTextWidget(
                  title: 'Quais são as vantagens do Bitcoin?',
                  description: _informationBitcoins.text2,
                ),
                InfoTextWidget(
                  title: 'Como comprar e vender bitcoins?',
                  description: _informationBitcoins.text3,
                ),
                InfoTextWidget(
                  title: 'Bitcoin é seguro?',
                  description: _informationBitcoins.text4,
                ),
                InfoTextWidget(
                  title: 'Ainda vale a pena investir em Bitcoins?',
                  description: _informationBitcoins.text5,
                ),
                InfoTextWidget(
                  title: 'Quem criou o Bitcoin?',
                  description: _informationBitcoins.text6,
                ),
                InfoTextWidget(
                  title: 'Seja seu próprio banco',
                  description: _informationBitcoins.text7,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
