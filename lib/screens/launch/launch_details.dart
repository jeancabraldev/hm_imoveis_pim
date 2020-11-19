import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hm_imoveis_pim/components/buttons/raised/raised_button_widget.dart';
import 'package:hm_imoveis_pim/models/launch/launch.dart';
import 'package:hm_imoveis_pim/models/preferences/preferences_manager.dart';
import 'package:hm_imoveis_pim/models/user/user_manager.dart';
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
        title: Text('Código ${launch.code}'),
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
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        'R\$ ${launch.price.toStringAsFixed(3)}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
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
                          IconButton(
                            icon: Icon(
                              FontAwesomeIcons.questionCircle,
                              size: 20,
                              color: Colors.grey[500],
                            ),
                            onPressed: () {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: const [
                                            Text(
                                              'Bitcoins',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'Acesse a tela de Bitcoins para ver a cotação do dia, e ver o valor da entrada desse imóvel.',
                                              textAlign: TextAlign.justify,
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'FECHAR',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: !darkTheme.darkTheme()
                                                  ? ColorsApp.primaryColor()
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Icon(
                            FontAwesomeIcons.hardHat,
                            color: !darkTheme.darkTheme()
                                ? ColorsApp.primaryColor()
                                : ColorsApp.secondaryColor(),
                          ),
                          Text(launch.situation),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            FontAwesomeIcons.solidBuilding,
                            color: !darkTheme.darkTheme()
                                ? ColorsApp.primaryColor()
                                : ColorsApp.secondaryColor(),
                          ),
                          Text(launch.type),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          //TODO: ABRIR MAPA
                        },
                        child: Column(
                          children: [
                            Icon(
                              FontAwesomeIcons.map,
                              color: !darkTheme.darkTheme()
                                  ? ColorsApp.primaryColor()
                                  : ColorsApp.secondaryColor(),
                            ),
                            const Text('Localização')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        launch.address,
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        '${launch.district} - ${launch.state}',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
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
            child: Consumer<UserManager>(
              builder: (_, userManager, __) {
                if (userManager.isLoggedIn) {
                  return RaisedButtonWidget(
                    onPressed: () => Navigator.of(context)
                        .pushNamed('/interestLaunch', arguments: launch),
                    text: const Text(
                      'TENHO INTERESSE',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          wordSpacing: 2,
                          color: Colors.black),
                    ),
                    color: ColorsApp.secondaryColor(),
                  );
                } else {
                  return RaisedButtonWidget(
                    onPressed: () => Navigator.of(context).pushNamed('/login'),
                    text: const Text(
                      'FAZER LOGIN',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          wordSpacing: 2,
                          color: Colors.black),
                    ),
                    color: ColorsApp.secondaryColor(),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
