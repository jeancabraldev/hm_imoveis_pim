import 'package:flutter/material.dart';
import 'package:hm_imoveis_pim/models/bitcoin/bitcoin_manager.dart';
import 'package:hm_imoveis_pim/models/launch/launch_manager.dart';
import 'package:hm_imoveis_pim/models/preferences/preferences_manager.dart';
import 'package:hm_imoveis_pim/models/properties/properties_manager.dart';
import 'package:hm_imoveis_pim/models/user/user_manager.dart';
import 'package:hm_imoveis_pim/screens/base/base_screen.dart';
import 'package:hm_imoveis_pim/screens/bitcoin/bitcoin_details_screen.dart';
import 'package:hm_imoveis_pim/screens/law/law_details_sreen.dart';
import 'package:hm_imoveis_pim/screens/login/login_screen.dart';
import 'package:hm_imoveis_pim/screens/properties/properties_details.dart';
import 'package:hm_imoveis_pim/screens/signup/sinup_screen.dart';
import 'package:hm_imoveis_pim/screens/transaction/transaction_details_screen.dart';
import 'package:hm_imoveis_pim/utils/colors_app.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    MyApp(
      preferences: sharedPreferences,
    ),
  );
}

class MyApp extends StatefulWidget {
  final SharedPreferences preferences;

  const MyApp({Key key, @required this.preferences})
      : assert(preferences != null),
        super(key: key);

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PreferencesManager _preferencesManager;

  @override
  void initState() {
    _preferencesManager = PreferencesManager(widget.preferences);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PreferencesManager>(
          create: (_) => PreferencesManager(widget.preferences),
        ),
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => BitcoinManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => PropertiesManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => LaunchManager(),
          lazy: false,
        )
      ],
      child: StreamBuilder(
        initialData: _preferencesManager,
        stream: _preferencesManager.stream,
        builder: (context, snapshot) {
          return MaterialApp(
            title: 'HM Imóveis',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.light,
              accentColor: ColorsApp.primaryColor().withAlpha(50),
              scaffoldBackgroundColor: ColorsApp.primaryColor(),
              primaryColor: ColorsApp.primaryColor(),
              visualDensity: VisualDensity.adaptivePlatformDensity,
              /*textTheme: GoogleFonts.montserratTextTheme(
                Theme.of(context).textTheme,
              ),*/
              fontFamily: 'Montserrat',
              textTheme: TextTheme(
                bodyText2: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
              appBarTheme: const AppBarTheme(
                elevation: 0,
              ),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: ColorsApp.primaryColorDark(),
              accentColor: ColorsApp.primaryColorDark().withAlpha(50),
              scaffoldBackgroundColor: ColorsApp.backgroundColorDark(),
              visualDensity: VisualDensity.adaptivePlatformDensity,
              fontFamily: 'Montserrat',
              appBarTheme: const AppBarTheme(elevation: 0),
              cardColor: ColorsApp.primaryColorDark(),
              canvasColor: ColorsApp.backgroundColorDark(),
            ),
            themeMode: _preferencesManager.darkTheme()
                ? ThemeMode.dark
                : ThemeMode.light,
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

                case '/propertiesDetails':
                  return MaterialPageRoute(
                    builder: (_) => PropertiesDetails(),
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
          );
        },
      ),
    );
  }
}
