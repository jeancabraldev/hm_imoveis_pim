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
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
                image: const DecorationImage(
                  image: AssetImage('assets/images/account.png'),
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
                          title: 'Meus Dados',
                          subTitle: '',
                          leading: FontAwesomeIcons.userAlt,
                          onTap: () =>
                              Navigator.of(context).pushNamed('/myAccount'),
                        ),
                        const Divider(),
                        ListTileWidget(
                          title: 'Minhas Transações',
                          subTitle: '',
                          leading: FontAwesomeIcons.handsHelping,
                          onTap: () =>
                              Navigator.of(context).pushNamed('/myTransaction'),
                        ),
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
