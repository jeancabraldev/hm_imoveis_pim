import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hm_imoveis_pim/models/page/page_manager.dart';
import 'package:hm_imoveis_pim/screens/about_us/about_screen.dart';
import 'package:hm_imoveis_pim/screens/account/account_screen.dart';
import 'package:hm_imoveis_pim/screens/bitcoin/bitcoin_screen.dart';
import 'package:hm_imoveis_pim/screens/company/local_company_screen.dart';
import 'package:hm_imoveis_pim/screens/contact_us/contact_us_screen.dart';
import 'package:hm_imoveis_pim/screens/information/information_screen.dart';
import 'package:hm_imoveis_pim/screens/launch/launch_screen.dart';
import 'package:hm_imoveis_pim/screens/properties/properties_screen.dart';
import 'package:hm_imoveis_pim/screens/setting/setting_screen.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    //Travando a orientação na vertical
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          PropertiesScreen(),
          LaunchScreen(),
          BitcoinScreen(),
          AboutUsScreen(),
          ContactUsScreen(),
          LocalCompanyScreen(),
          InformationScreen(),
          AccountScreen(),
          SettingScreen(),
        ],
      ),
    );
  }
}
