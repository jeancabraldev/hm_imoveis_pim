import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hm_imoveis_pim/models/preferences/preferences_manager.dart';
import 'package:provider/provider.dart';

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
    this.initialValue,
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
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<PreferencesManager>(context);
    return TextFormField(
      style: TextStyle(
          color: darkMode.darkTheme() ? Colors.white : Colors.grey[700]),
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
      initialValue: initialValue,
    );
  }
}
