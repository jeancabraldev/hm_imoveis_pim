import 'package:flutter/material.dart';
import 'package:hm_imoveis_pim/models/preferences/preferences_manager.dart';
import 'package:hm_imoveis_pim/screens/about_us/information_about_us.dart';
import 'package:hm_imoveis_pim/utils/colors_app.dart';
import 'package:provider/provider.dart';

class SlideScreen extends StatelessWidget {
  final InformationAboutUs info = InformationAboutUs();
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        slideBitcoins(context),
        slideLGPD(context),
        slideBlockchain(context),
      ],
    );
  }

  //Bitcoins
  Container slideBitcoins(BuildContext context) {
    final darkTheme = Provider.of<PreferencesManager>(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: const Image(
              image: AssetImage('assets/images/bitcoin_value.png'),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Bitcoins',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: !darkTheme.darkTheme()
                  ? ColorsApp.primaryColor()
                  : ColorsApp.secondaryColor(),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            info.text4,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: const Icon(
              Icons.arrow_forward,
              size: 20,
            ),
          )
        ],
      ),
    );
  }

  //Lei LGPD
  Container slideLGPD(BuildContext context) {
    final darkTheme = Provider.of<PreferencesManager>(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 200,
            child: const Image(
              image: AssetImage('assets/images/law.png'),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Lei LGPD',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: !darkTheme.darkTheme()
                  ? ColorsApp.primaryColor()
                  : ColorsApp.secondaryColor(),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            info.text3,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: const Icon(
              Icons.arrow_forward,
              size: 20,
            ),
          )
        ],
      ),
    );
  }

  //Lei LGPD
  Container slideBlockchain(BuildContext context) {
    final darkTheme = Provider.of<PreferencesManager>(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 200,
            child: const Image(
              image: AssetImage('assets/images/law.png'),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Blockchain',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: !darkTheme.darkTheme()
                  ? ColorsApp.primaryColor()
                  : ColorsApp.secondaryColor(),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            info.text2,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: const Icon(
              Icons.arrow_forward,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}
