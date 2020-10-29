import 'package:flutter/material.dart';
import 'package:hm_imoveis_pim/models/preferences/preferences_manager.dart';
import 'package:hm_imoveis_pim/utils/colors_app.dart';
import 'package:provider/provider.dart';

class InfoTextWidget extends StatelessWidget {
  const InfoTextWidget({
    this.title,
    this.description,
  });
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<PreferencesManager>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: darkTheme.darkTheme()
                ? ColorsApp.secondaryColor()
                : ColorsApp.primaryColor(),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
