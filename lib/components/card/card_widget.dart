import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hm_imoveis_pim/components/buttons/icon/icon_button_widget.dart';
import 'package:hm_imoveis_pim/models/preferences/preferences_manager.dart';
import 'package:hm_imoveis_pim/utils/colors_app.dart';
import 'package:provider/provider.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    this.pathImage,
    this.address,
    this.city,
    this.hour1,
    this.hour2,
  });

  final String pathImage;
  final String address;
  final String city;
  final String hour1;
  final String hour2;

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<PreferencesManager>(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1),
      ),
      elevation: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
            height: 240,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              pathImage,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'HM Imóveis',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: darkTheme.darkTheme()
                        ? ColorsApp.secondaryColor()
                        : ColorsApp.primaryColor(),
                  ),
                ),
                const SizedBox(height: 20),
                Text(address),
                Text(city),
                Text(hour1),
                Text(hour2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButtonWidget(
                      onTap: () {},
                      color: darkTheme.darkTheme()
                          ? ColorsApp.secondaryColor()
                          : ColorsApp.primaryColor(),
                      size: 24,
                      icon: FontAwesomeIcons.mapMarkerAlt,
                    ),
                    const SizedBox(width: 10),
                    IconButtonWidget(
                      onTap: () {
                        //TODO: AÇÃO DOS BOTÕES
                      },
                      color: darkTheme.darkTheme()
                          ? ColorsApp.secondaryColor()
                          : ColorsApp.primaryColor(),
                      size: 24,
                      icon: FontAwesomeIcons.phoneAlt,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
