import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'currency_convertor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CurrencyConverter(),
    );
  }
}
