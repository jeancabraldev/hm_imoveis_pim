import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hm_imoveis_pim/components/drawer/components/page_tile_widget.dart';
import 'package:hm_imoveis_pim/models/page/page_manager.dart';
import 'package:provider/provider.dart';

class SectionPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int currentPage = context.watch<PageManager>().page;
    return Column(
      children: [
        PageTileWidget(
          text: 'Imóveis',
          icon: FontAwesomeIcons.houseUser,
          page: 0,
          highLighted: currentPage == 0,
        ),
        PageTileWidget(
          text: 'Lançamentos',
          icon: FontAwesomeIcons.solidBuilding,
          page: 1,
          highLighted: currentPage == 1,
        ),
        PageTileWidget(
          text: 'Bitcoins',
          icon: FontAwesomeIcons.bitcoin,
          page: 2,
          highLighted: currentPage == 2,
        ),
        PageTileWidget(
          text: 'Sobre Nós',
          icon: FontAwesomeIcons.userTie,
          page: 3,
          highLighted: currentPage == 3,
        ),
        PageTileWidget(
          text: 'Fale Conosco',
          icon: FontAwesomeIcons.headset,
          page: 4,
          highLighted: currentPage == 4,
        ),
        PageTileWidget(
          text: 'Localização',
          icon: FontAwesomeIcons.mapMarkerAlt,
          page: 5,
          highLighted: currentPage == 5,
        ),
        PageTileWidget(
          text: 'Informações',
          icon: FontAwesomeIcons.info,
          page: 6,
          highLighted: currentPage == 6,
        ),
        PageTileWidget(
          text: 'Minha Conta',
          icon: FontAwesomeIcons.userAlt,
          page: 7,
          highLighted: currentPage == 7,
        ),
        PageTileWidget(
          text: 'Configurações',
          icon: FontAwesomeIcons.cog,
          page: 8,
          highLighted: currentPage == 8,
        ),
      ],
    );
  }
}