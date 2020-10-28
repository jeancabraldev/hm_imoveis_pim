import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              children: const [
                Text('Escrever texto aqui'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
