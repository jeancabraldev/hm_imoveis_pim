import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hm_imoveis_pim/components/buttons/raised/raised_button_widget.dart';
import 'package:hm_imoveis_pim/models/launch/launch.dart';
import 'package:hm_imoveis_pim/models/preferences/preferences_manager.dart';
import 'package:hm_imoveis_pim/utils/colors_app.dart';
import 'package:provider/provider.dart';

class LaunchDetails extends StatelessWidget {
  const LaunchDetails(this.launch);
  final Launch launch;
  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<PreferencesManager>(context);
    const TextStyle styleText =
        TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
    return Scaffold(
      backgroundColor:
          !darkTheme.darkTheme() ? Colors.white : ColorsApp.primaryColorDark(),
      appBar: AppBar(
        title: Text(launch.title),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 1.55,
            child: Carousel(
              images: launch.images.map((url) {
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  launch.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: !darkTheme.darkTheme()
                        ? ColorsApp.primaryColor()
                        : Colors.white,
                  ),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      'R\$ ${launch.price.toStringAsFixed(3)}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Icon(
                          FontAwesomeIcons.bitcoin,
                          color: !darkTheme.darkTheme()
                              ? ColorsApp.primaryColor()
                              : ColorsApp.secondaryColor(),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          launch.thenBitcoin,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            launch.footage,
                            style: styleText,
                          ),
                          const Text('Área'),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            launch.dormitories,
                            style: styleText,
                          ),
                          const Text('Quartos'),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            launch.wc,
                            style: styleText,
                          ),
                          const Text('Banheiros'),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            launch.garage,
                            style: styleText,
                          ),
                          const Text('Vagas'),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${launch.district} - ${launch.state}'),
                      GestureDetector(
                        onTap: () {
                          //TODO: ABRIR MAPA
                        },
                        child: Column(
                          children: const [
                            Icon(FontAwesomeIcons.map),
                            Text('Localização')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Text(
                    launch.description,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: RaisedButtonWidget(
              onPressed: () {
                //TODO: TELA DE INTERESSE
              },
              text: const Text(
                'TENHO INTERESSE',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    wordSpacing: 2,
                    color: Colors.black),
              ),
              color: ColorsApp.secondaryColor(),
            ),
          )
        ],
      ),
    );
  }
}
