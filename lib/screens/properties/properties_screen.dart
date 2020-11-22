import 'package:flutter/material.dart';
import 'package:hm_imoveis_pim/components/drawer/drawer_widget.dart';
import 'package:hm_imoveis_pim/components/search/search_widget.dart';
import 'package:hm_imoveis_pim/models/properties/properties_manager.dart';
import 'package:hm_imoveis_pim/screens/properties/properties_list_tile_widget.dart';
import 'package:provider/provider.dart';

class PropertiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          title: Consumer<PropertiesManager>(
            builder: (_, propertiesManager, __) {
              if (propertiesManager.search.isEmpty) {
                return const Text('Imóveis');
              } else {
                return LayoutBuilder(
                  builder: (_, constraints) {
                    return GestureDetector(
                      onTap: () async {
                        final search = await showDialog<String>(
                            context: context,
                            builder: (_) =>
                                SearchWidget(propertiesManager.search));
                        //Se a pesquisa for diferente de nula a pesquisa será enviada properties manager
                        if (search != null) {
                          propertiesManager.search = search;
                        }
                      },
                      child: Container(
                        width: constraints.biggest.width,
                        child: Text(
                          propertiesManager.search,
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
            Consumer<PropertiesManager>(
              builder: (_, propertiesManager, __) {
                if (propertiesManager.search.isEmpty) {
                  return IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () async {
                      final search = await showDialog<String>(
                          context: context,
                          builder: (_) =>
                              SearchWidget(propertiesManager.search));
                      //Se a pesquisa for diferente de nula a pesquisa será enviada para properties manager
                      if (search != null) {
                        propertiesManager.search = search;
                      }
                    },
                  );
                } else {
                  return IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () async => propertiesManager.search = '',
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
          child: Consumer<PropertiesManager>(
            builder: (_, propertiesManager, __) {
              final filteredProperties = propertiesManager.filteredProperties;
              return TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                    ),
                    itemCount: filteredProperties.length,
                    itemBuilder: (_, index) {
                      return PropertiesListTileWidget(
                        filteredProperties[index],
                        type: 'grid',
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: filteredProperties.length,
                    itemBuilder: (_, index) {
                      return PropertiesListTileWidget(
                        filteredProperties[index],
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
