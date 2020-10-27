import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RaisedButtonWidget extends StatelessWidget {
  const RaisedButtonWidget({
    this.text,
    this.color,
    this.onPressed,
    this.disabledColor,
  });

  final Widget text;
  final Color color;
  final VoidCallback onPressed;
  final Color disabledColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      height: 45,
      child: RaisedButton(
        onPressed: onPressed,
        color: color,
        disabledColor: disabledColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: text,
      ),
    );
  }
}
