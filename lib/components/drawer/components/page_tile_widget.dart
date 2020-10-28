import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hm_imoveis_pim/models/page/page_manager.dart';
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
    return ListTile(
      title: Text(
        text,
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: highLighted ? ColorsApp.primaryColor() : Colors.grey[700],
            fontSize: 16,
          ),
        ),
      ),
      leading: Icon(
        icon,
        color: highLighted ? ColorsApp.primaryColor() : Colors.grey[700],
        size: 22,
      ),
      onTap: () {
        context.read<PageManager>().setPage(page);
      },
    );
  }
}

/*SizedBox(
      height: 60,
      child: Row(
        children: [
          Icon(
            icon,
            color: highLighted ? ColorsApp.primaryColor() : Colors.grey[700],
            size: 22,
          ),
          Text(
            text,
            style: TextStyle(
              color: highLighted ? ColorsApp.primaryColor() : Colors.grey[700],
              fontSize: 15,
            ),
          ),
        ],
      ),
    );*/
