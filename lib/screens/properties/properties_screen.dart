import 'package:flutter/material.dart';
import 'package:hm_imoveis_pim/components/drawer/drawer_widget.dart';
import 'package:hm_imoveis_pim/components/search/search_widget.dart';
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
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => SearchWidget(
                  onFieldSubmitted: (text) {
                    Navigator.of(context).pop(text);
                  },
                ),
              );
            },
          ),
        ],
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
