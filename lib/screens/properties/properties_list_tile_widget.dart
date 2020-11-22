import 'package:flutter/material.dart';
import 'package:hm_imoveis_pim/models/preferences/preferences_manager.dart';
import 'package:hm_imoveis_pim/models/properties/properties.dart';
import 'package:hm_imoveis_pim/utils/colors_app.dart';
import 'package:provider/provider.dart';

class PropertiesListTileWidget extends StatelessWidget {
  const PropertiesListTileWidget(this.properties, {this.type});
  final Properties properties;
  final String type;

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<PreferencesManager>(context);
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed('/propertiesDetails', arguments: properties),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1),
        ),
        elevation: 3,
        child: type == 'list'
            ? viewListProperties(context, darkTheme)
            : viewGridProperties(context, darkTheme),
      ),
    );
  }

  //Visualização em grade
  Container viewGridProperties(
      BuildContext context, PreferencesManager darkTheme) {
    return Container(
      height: 310,
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // ignore: sized_box_for_whitespace
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              properties.images.first,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  properties.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: !darkTheme.darkTheme()
                        ? ColorsApp.primaryColor()
                        : ColorsApp.secondaryColor(),
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
                Text(
                  '${properties.city} - ${properties.state}',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'R\$ ${properties.price.toStringAsFixed(3)}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  properties.type,
                  style: TextStyle(
                    color: !darkTheme.darkTheme()
                        ? ColorsApp.primaryColor()
                        : ColorsApp.secondaryColor(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //Visualização em lista
  Row viewListProperties(BuildContext context, PreferencesManager darkTheme) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(1),
          width: 100,
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              properties.images.first,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  properties.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: !darkTheme.darkTheme()
                        ? ColorsApp.primaryColor()
                        : ColorsApp.secondaryColor(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 3),
                  child: Text('${properties.city} - ${properties.state}'),
                ),
                Text(
                  'R\$ ${properties.price.toStringAsFixed(3)}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 3),
                Text(
                  properties.type,
                  style: TextStyle(
                    color: !darkTheme.darkTheme()
                        ? ColorsApp.primaryColor()
                        : ColorsApp.secondaryColor(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
