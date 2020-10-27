import 'package:flutter/material.dart';
import 'package:hm_imoveis_pim/components/drawer/components/drawer_header_widget.dart';
import 'package:hm_imoveis_pim/components/drawer/components/section_page_widget.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.horizontal(
        right: Radius.circular(30),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.90,
        child: Drawer(
          child: ListView(
            children: [
              DrawerHeaderWidget(),
              SectionPageWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
