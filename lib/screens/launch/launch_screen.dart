import 'package:flutter/material.dart';
import 'package:hm_imoveis_pim/components/drawer/drawer_widget.dart';
import 'package:hm_imoveis_pim/components/search/search_widget.dart';
import 'package:hm_imoveis_pim/models/launch/launch_manager.dart';
import 'package:provider/provider.dart';

import 'launch_list_tile_widget.dart';

class LaunchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text('Lançamentos'),
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
        child: Consumer<LaunchManager>(
          builder: (_, launchManager, __) {
            return ListView.builder(
              itemCount: launchManager.allLaunchs.length,
              itemBuilder: (_, index) {
                return LaunchListTileWidget(
                  launchManager.allLaunchs[index],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
