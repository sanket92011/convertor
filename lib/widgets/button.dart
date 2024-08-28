import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPress;

  const Button({super.key, required this.buttonText, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SizedBox(
        height: 50,
        child: FilledButton(
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.black),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          onPressed: onPress,
          child: Text(buttonText),
        ),
      ),
    );
  }
}
