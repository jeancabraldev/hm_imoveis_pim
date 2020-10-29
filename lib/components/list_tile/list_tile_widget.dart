import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    this.title,
    this.leading,
    this.onTap,
  });

  final String title;
  final IconData leading;
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(leading),
      onTap: onTap,
    );
  }
}
