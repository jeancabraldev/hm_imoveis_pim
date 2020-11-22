import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hm_imoveis_pim/components/list_tile/list_tile_widget.dart';

class VersionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações do aplicativo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                ListTileWidget(
                  title: 'Desenvolvido por',
                  subTitle: 'Help Technology',
                  leading: FontAwesomeIcons.laptopCode,
                ),
                Divider(),
                ListTileWidget(
                  title: 'Versão',
                  subTitle: '1.0.0',
                  leading: FontAwesomeIcons.codeBranch,
                ),
                Divider(),
                ListTileWidget(
                  title: 'Última atualização',
                  subTitle: '22/11/2020',
                  leading: FontAwesomeIcons.history,
                ),
                Divider(),
                ListTileWidget(
                  title: 'Suporte técnico',
                  subTitle: 'suporte@helptech.com.br',
                  leading: FontAwesomeIcons.envelopeOpenText,
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
