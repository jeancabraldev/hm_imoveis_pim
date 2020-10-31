import 'package:flutter/material.dart';
import 'package:hm_imoveis_pim/models/preferences/preferences_manager.dart';
import 'package:hm_imoveis_pim/utils/colors_app.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({this.onFieldSubmitted});

  final ValueChanged<String> onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<PreferencesManager>(context);
    return Stack(
      children: [
        Positioned(
          top: 10,
          left: 12,
          right: 12,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextFormField(
              textInputAction: TextInputAction.search,
              autofocus: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                prefixIcon: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: !darkTheme.darkTheme()
                        ? ColorsApp.primaryColor()
                        : ColorsApp.secondaryColor(),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              onFieldSubmitted: onFieldSubmitted,
            ),
          ),
        ),
      ],
    );
  }
}
