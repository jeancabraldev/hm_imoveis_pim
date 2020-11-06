import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:hm_imoveis_pim/models/preferences/preferences_manager.dart';
import 'package:hm_imoveis_pim/models/properties/properties.dart';
import 'package:hm_imoveis_pim/utils/colors_app.dart';
import 'package:provider/provider.dart';

class PropertiesDetails extends StatelessWidget {
  const PropertiesDetails(this.properties);

  final Properties properties;

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<PreferencesManager>(context);
    return Scaffold(
      backgroundColor:
          !darkTheme.darkTheme() ? Colors.white : ColorsApp.primaryColorDark(),
      appBar: AppBar(
        title: Text(properties.title),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              AspectRatio(
                aspectRatio: 1.55,
                child: Carousel(
                  images: properties.images.map((url) {
                    return NetworkImage(url);
                  }).toList(),
                  dotSize: 4,
                  dotSpacing: 15,
                  dotColor: !darkTheme.darkTheme()
                      ? ColorsApp.primaryColor()
                      : ColorsApp.secondaryColor(),
                  dotBgColor: Colors.transparent,
                  autoplay: false,
                ),
              ),
              Text(properties.title),
            ],
          )
        ],
      ),
    );
  }
}
