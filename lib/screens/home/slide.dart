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
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: const Image(
              image: AssetImage('assets/images/bitcoin.png'),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
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
          const SizedBox(height: 10),
          Text(
            info.text4,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
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
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: const Image(
              image: AssetImage('assets/images/law.png'),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
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
          const SizedBox(height: 10),
          Text(
            info.text3,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 5),
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
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: const Image(
              image: AssetImage('assets/images/blockchain.png'),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
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
          const SizedBox(height: 10),
          Text(
            info.text2,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 25),
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
