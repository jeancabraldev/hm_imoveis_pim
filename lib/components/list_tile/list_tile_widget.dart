import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    this.title,
    this.leading,
    this.subTitle,
    this.onTap,
  });

  final String title;
  final IconData leading;
  final String subTitle;
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      leading: Icon(leading),
      onTap: onTap,
    );
  }
}
