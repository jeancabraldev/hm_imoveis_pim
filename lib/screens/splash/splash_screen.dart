import 'package:flutter/material.dart';
import 'package:hm_imoveis_pim/screens/base/base_screen.dart';
import 'package:hm_imoveis_pim/utils/colors_app.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenInitial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SplashScreen(
            seconds: 5,
            backgroundColor: ColorsApp.primaryColor(),
            navigateAfterSeconds: BaseScreen(),
            loaderColor: Colors.white,
            loadingText: const Text(
              'Carregando...',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Container(
            width: 160,
            height: 160,
            margin: const EdgeInsets.only(top: 250, left: 100, right: 100),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
