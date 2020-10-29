import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hm_imoveis_pim/components/drawer/drawer_widget.dart';
import 'package:hm_imoveis_pim/models/preferences/preferences_manager.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final preferencesManager = Provider.of<PreferencesManager>(context);
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text(
          'Configurações',
          style: GoogleFonts.montserrat(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 160,
              height: 160,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/information.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.19,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 5, top: 12, right: 1, bottom: 12),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 9,
                              child: preferencesManager.darkTheme()
                                  ? Icon(Icons.brightness_4)
                                  : Icon(Icons.brightness_high),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 70,
                              child: SwitchListTile(
                                title: const Text('Tema do Aplicativo'),
                                subtitle: const Text(
                                    'Defina entre o tema escuro ou claro'),
                                onChanged: (value) => preferencesManager
                                    .useDarkTheme(value: value),
                                value: preferencesManager.darkTheme(),
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
