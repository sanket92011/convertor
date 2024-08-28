import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final Icon fieldIcon;
  final TextEditingController textEditingController;
  final bool isPassword;

  CustomTextfield(
      {super.key,
      required this.hintText,
      required this.fieldIcon,
      required this.textEditingController,
      required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword == true ? true : false,
      controller: textEditingController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: fieldIcon,
      ),
    );
  }
}
