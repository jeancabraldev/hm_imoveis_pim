import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hm_imoveis_pim/components/buttons/raised/raised_button_widget.dart';
import 'package:hm_imoveis_pim/components/drawer/drawer_widget.dart';
import 'package:hm_imoveis_pim/models/bitcoin/bitcoin_manager.dart';
import 'package:hm_imoveis_pim/utils/colors_app.dart';
import 'package:provider/provider.dart';

class BitcoinScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text(
          'Bitcoin',
          style: GoogleFonts.montserrat(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                color: ColorsApp.primaryColor(),
                shape: BoxShape.circle,
                image: const DecorationImage(
                  image: AssetImage('assets/images/bitcoin.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Consumer<BitcoinManager>(
                      builder: (_, bitcoinManager, __) {
                        return Column(
                          children: [
                            Text(
                              'R\$ ${bitcoinManager.price}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            RaisedButtonWidget(
                              color: ColorsApp.secondaryColor(),
                              text: const Text(
                                'ATUALIZAR VALOR',
                                style: TextStyle(
                                  letterSpacing: 2,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () => bitcoinManager.showPrice(),
                            ),
                            const SizedBox(height: 50),
                            Row(
                              children: [
                                const Text(
                                  'Duvidas sobre Bitcoins?',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: GestureDetector(
                                    onTap: () => Navigator.of(context)
                                        .pushNamed('/bitcoinDetails'),
                                    child: Text(
                                      'Clique aqui',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: ColorsApp.fourthColor(),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 30),
                            Text(
                              '* Cotação atual do valor de venda de 1 Bitcoin, esse valor é atualizado a cada 15 minutos.',
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
