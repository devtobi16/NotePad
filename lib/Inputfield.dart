import 'package:flutter/material.dart';
Widget InputField({
  final TextEditingController? controller,
  final TextInputType? keyboard,
  final TextInputAction? inputAction,
  final String? label,
  final Icon? icon,
  final String? Function(String?)? validator,
  final Color? borderColor,
  final Color? color,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboard ?? TextInputType.text,
    textInputAction: inputAction ?? TextInputAction.next,
    validator: validator,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(),
      filled: true,
      fillColor: Colors.white,
      suffixIcon: icon,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.purple,
          width: 2,
        ),
      ),
    ),
  );
}
