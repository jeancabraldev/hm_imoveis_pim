import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hm_imoveis_pim/models/bitcoin/bitcoin_manager.dart';
import 'package:hm_imoveis_pim/models/user/user_manager.dart';
import 'package:hm_imoveis_pim/screens/base/base_screen.dart';
import 'package:hm_imoveis_pim/screens/bitcoin/bitcoin_details_screen.dart';
import 'package:hm_imoveis_pim/screens/law/law_details_sreen.dart';
import 'package:hm_imoveis_pim/screens/login/login_screen.dart';
import 'package:hm_imoveis_pim/screens/signup/sinup_screen.dart';
import 'package:hm_imoveis_pim/screens/transaction/transaction_details_screen.dart';
import 'package:hm_imoveis_pim/utils/colors_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => BitcoinManager(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'HM Imóveis',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: ColorsApp.primaryColor(),
          primaryColor: ColorsApp.primaryColor(),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
          ),
        ),
        initialRoute: '/base',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/login':
              return MaterialPageRoute(
                builder: (_) => LoginScreen(),
              );
            case '/signup':
              return MaterialPageRoute(
                builder: (_) => SignupScreen(),
              );
            case '/bitcoinDetails':
              return MaterialPageRoute(
                builder: (_) => BitcoinDetailsWidget(),
              );
            case '/lawDetails':
              return MaterialPageRoute(
                builder: (_) => LawDetailsScreen(),
              );
            case '/transactionDetails':
              return MaterialPageRoute(
                builder: (_) => TransactionDetailsScreen(),
              );
            case '/base':
            default:
              return MaterialPageRoute(
                builder: (_) => BaseScreen(),
              );
          }
        },
      ),
    );
  }
}
