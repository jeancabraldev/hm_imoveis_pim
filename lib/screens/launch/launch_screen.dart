import 'package:flutter/material.dart';
import 'package:hm_imoveis_pim/components/drawer/drawer_widget.dart';
import 'package:hm_imoveis_pim/components/search/search_widget.dart';
import 'package:hm_imoveis_pim/models/launch/launch_manager.dart';
import 'package:provider/provider.dart';

import 'launch_list_tile_widget.dart';

class LaunchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          title: Consumer<LaunchManager>(
            builder: (_, launchManager, __) {
              if (launchManager.search.isEmpty) {
                return const Text('Lançamentos');
              } else {
                return LayoutBuilder(
                  builder: (_, constraints) {
                    return GestureDetector(
                      onTap: () async {
                        final search = await showDialog<String>(
                            context: context,
                            builder: (_) => SearchWidget(launchManager.search));
                        //Se a pesquisa for diferente de nula a pesquisa será enviada properties manager
                        if (search != null) {
                          launchManager.search = search;
                        }
                      },
                      // ignore: sized_box_for_whitespace
                      child: Container(
                        width: constraints.biggest.width,
                        child: Text(
                          launchManager.search,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
          centerTitle: true,
          actions: [
            Consumer<LaunchManager>(
              builder: (_, launchManager, __) {
                if (launchManager.search.isEmpty) {
                  return IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () async {
                      final search = await showDialog<String>(
                          context: context,
                          builder: (_) => SearchWidget(launchManager.search));
                      //Se a pesquisa for diferente de nula a pesquisa será enviada para launch manager
                      if (search != null) {
                        launchManager.search = search;
                      }
                    },
                  );
                } else {
                  return IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () async => launchManager.search = '',
                  );
                }
              },
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.view_stream)),
              Tab(icon: Icon(Icons.view_list)),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Consumer<LaunchManager>(
            builder: (_, launchManager, __) {
              final filteredLaunch = launchManager.filteredLaunch;
              return TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                    ),
                    itemCount: filteredLaunch.length,
                    itemBuilder: (_, index) {
                      return LaunchListTileWidget(
                        filteredLaunch[index],
                        type: 'grid',
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: filteredLaunch.length,
                    itemBuilder: (_, index) {
                      return LaunchListTileWidget(
                        filteredLaunch[index],
                        type: 'list',
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
