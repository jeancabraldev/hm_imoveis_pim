import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hm_imoveis_pim/components/drawer/drawer_widget.dart';
import 'package:hm_imoveis_pim/components/list_tile/list_tile_widget.dart';

class InformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text(
          'Informações',
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
                shape: BoxShape.circle,
                color: Colors.grey[200],
                image: const DecorationImage(
                  image: AssetImage('assets/images/information.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: MediaQuery.of(context).size.height * 0.33,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTileWidget(
                          title: 'Lei Geral de Proteção de Dados',
                          subTitle: '',
                          leading: FontAwesomeIcons.gavel,
                          onTap: () =>
                              Navigator.of(context).pushNamed('/lawDetails'),
                        ),
                        const Divider(),
                        ListTileWidget(
                          title: 'O que é um Bitcoin?',
                          subTitle: '',
                          leading: FontAwesomeIcons.bitcoin,
                          onTap: () => Navigator.of(context)
                              .pushNamed('/bitcoinDetails'),
                        ),
                        const Divider(),
/*                        ListTileWidget(
                          title: 'Como realizar uma transação?',
                          leading: FontAwesomeIcons.handsHelping,
                          onTap: () => Navigator.of(context)
                              .pushNamed('/transactionDetails'),
                        ),
                        const Divider(),*/
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
