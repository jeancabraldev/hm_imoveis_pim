import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyTransactionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Transações'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 200, left: 12, right: 12),
        child: Column(
          children: const [
            Icon(
              FontAwesomeIcons.handsHelping,
              color: Colors.white,
              size: 50,
            ),
            SizedBox(height: 30),
            Text(
              'Você ainda não possui nehuma transação!',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
