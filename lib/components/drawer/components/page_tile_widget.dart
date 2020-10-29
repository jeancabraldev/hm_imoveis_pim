import 'package:flutter/material.dart';
import 'package:hm_imoveis_pim/models/page/page_manager.dart';
import 'package:hm_imoveis_pim/models/preferences/preferences_manager.dart';
import 'package:hm_imoveis_pim/utils/colors_app.dart';
import 'package:provider/provider.dart';

class PageTileWidget extends StatelessWidget {
  const PageTileWidget({
    this.text,
    this.icon,
    this.highLighted = false,
    this.page,
  });

  final String text;
  final IconData icon;
  final bool highLighted;
  final int page;

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<PreferencesManager>(context);
    return ListTile(
      title: Text(
        text,
        style: TextStyle(
          color: darkMode.darkTheme()
              ? highLighted
                  ? ColorsApp.secondaryColor()
                  : Colors.white
              : highLighted
                  ? ColorsApp.primaryColor()
                  : Colors.grey[700],
          fontSize: 16,
        ),
      ),
      leading: Icon(
        icon,
        color: darkMode.darkTheme()
            ? highLighted
                ? ColorsApp.secondaryColor()
                : Colors.white
            : highLighted
                ? ColorsApp.primaryColor()
                : Colors.grey[700],
        size: 22,
      ),
      onTap: () {
        context.read<PageManager>().setPage(page);
      },
    );
  }
}
