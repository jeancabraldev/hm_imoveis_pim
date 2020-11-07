import 'package:flutter/material.dart';
import 'package:hm_imoveis_pim/models/launch/launch.dart';
import 'package:hm_imoveis_pim/models/preferences/preferences_manager.dart';
import 'package:hm_imoveis_pim/utils/colors_app.dart';
import 'package:provider/provider.dart';

class LaunchListTileWidget extends StatelessWidget {
  const LaunchListTileWidget(this.launch);
  final Launch launch;

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<PreferencesManager>(context);
    return GestureDetector(
      onTap: () =>
          Navigator.of(context).pushNamed('/launchDetails', arguments: launch),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        elevation: 3,
        child: Container(
          height: 310,
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  launch.images.first,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      launch.title,
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
                      '${launch.city} - ${launch.state}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'R\$ ${launch.price.toStringAsFixed(3)}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      launch.type,
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
        ),
      ),
    );
    ;
  }
}
