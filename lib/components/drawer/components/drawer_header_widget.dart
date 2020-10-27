import 'package:flutter/material.dart';
import 'package:hm_imoveis_pim/components/drawer/components/info_header_widget.dart';
import 'package:hm_imoveis_pim/utils/colors_app.dart';

class DrawerHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsApp.primaryColor(),
      height: 120,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: InfoHeaderWidget(),
      ),
    );
  }
}
