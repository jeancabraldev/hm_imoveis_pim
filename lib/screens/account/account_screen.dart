import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hm_imoveis_pim/components/drawer/drawer_widget.dart';
import 'package:hm_imoveis_pim/components/list_tile/list_tile_widget.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text(
          'Minha Conta',
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
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/information.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.29,
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
                            title: 'Meus Dados',
                            leading: FontAwesomeIcons.userAlt,
                            onTap: () {
                              //TODO: CRIAR TELA DOS DADOS DO USUÁRIO
                            }),
                        const Divider(),
                        ListTileWidget(
                            title: 'Minhas Transações',
                            leading: FontAwesomeIcons.handsHelping,
                            onTap: () {
                              //TODO: CRIAR TELA DAS TRANSAÇÕES DO CLIENTE
                            }),
                        const Divider(),
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
