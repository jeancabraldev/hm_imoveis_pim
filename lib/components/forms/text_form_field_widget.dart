import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    this.textInputType,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.obscureText = false,
    this.autocorrect = true,
    this.onChanged,
    this.enabled,
    this.inputFormatters,
    this.validator,
    this.controller,
    this.onSaved,
  });

  final TextInputType textInputType;
  final IconData prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  final bool obscureText;
  final bool autocorrect;
  final ValueChanged<String> onChanged;
  final bool enabled;
  final List<TextInputFormatter> inputFormatters;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final FormFieldSetter<String> onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.grey[700]),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        isDense: true,
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.grey[500],
        ),
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey[500],
          fontSize: 14,
        ),
      ),
      keyboardType: textInputType,
      obscureText: obscureText,
      autocorrect: autocorrect,
      onChanged: onChanged,
      enabled: enabled,
      inputFormatters: inputFormatters,
      validator: validator,
      controller: controller,
      onSaved: onSaved,
    );
  }
}
