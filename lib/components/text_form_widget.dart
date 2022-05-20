import 'package:flutter/material.dart';
class TextFieldWidget extends StatelessWidget {
  String labelText;
  Widget prefixIcon;
  Widget? sulfixIcon;
  TextEditingController? controller;
  ValueChanged<String>? onChanged;

  TextFieldWidget(
      this.labelText,
      this.prefixIcon,{
        this.sulfixIcon,
        this.controller,
        this.onChanged,
      });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: sulfixIcon,
      ),
      controller: controller,
      onChanged: onChanged,
    );
  }
}