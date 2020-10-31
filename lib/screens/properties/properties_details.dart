import 'package:flutter/material.dart';

class PropertiesDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Imóveis'),
              background: Image.asset(
                'assets/images/house.png',
                fit: BoxFit.cover,
              ),
            ),
            backgroundColor: Colors.red,
          ),
          const SliverFillRemaining(
            child: Center(
              child: Text('Content'),
            ),
          ),
        ],
      ),
    );
  }
}
