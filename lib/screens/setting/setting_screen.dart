import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hm_imoveis_pim/components/drawer/drawer_widget.dart';
import 'package:hm_imoveis_pim/models/preferences/preferences_manager.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<PreferencesManager>(context);
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
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
                image: const DecorationImage(
                  image: AssetImage('assets/images/settings.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
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
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              width: MediaQuery.of(context).size.width / 9,
                              child: darkTheme.darkTheme()
                                  ? const Icon(Icons.brightness_4)
                                  : Icon(Icons.brightness_high,
                                      color: Colors.grey[700]),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 70,
                              child: SwitchListTile(
                                title: const Text('Tema do Aplicativo'),
                                subtitle: const Text(
                                    'Defina entre o tema escuro ou claro'),
                                onChanged: (value) =>
                                    darkTheme.useDarkTheme(value: value),
                                value: darkTheme.darkTheme(),
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushNamed('/versionApplication'),
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 9,
                                child: Icon(
                                  Icons.play_for_work,
                                  size: 32,
                                  color: !darkTheme.darkTheme()
                                      ? Colors.grey[700]
                                      : Colors.white,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 70,
                                child: const ListTile(
                                  title: Text('Versão'),
                                  subtitle: Text('Informações do aplicativo'),
                                ),
                              ),
                            ],
                          ),
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
