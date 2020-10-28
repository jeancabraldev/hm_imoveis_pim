import 'package:flutter/material.dart';
import 'package:hm_imoveis_pim/utils/colors_app.dart';

class InfoTextWidget extends StatelessWidget {
  const InfoTextWidget({
    this.title,
    this.description,
  });
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: ColorsApp.fourthColor(),
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
