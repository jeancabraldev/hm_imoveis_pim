import 'package:flutter/material.dart';
import 'package:hm_imoveis_pim/components/drawer/drawer_widget.dart';
import 'package:hm_imoveis_pim/models/properties/properties_manager.dart';
import 'package:hm_imoveis_pim/screens/properties/properties_list_tile_widget.dart';
import 'package:provider/provider.dart';

class PropertiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text('Imóveis'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Consumer<PropertiesManager>(
          builder: (_, propertiesManager, __) {
            return ListView.builder(
              itemCount: propertiesManager.allProperties.length,
              itemBuilder: (_, index) {
                return PropertiesListTileWidget(
                    propertiesManager.allProperties[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
