import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final TextEditingController textEditingController = TextEditingController();
  final String currencyUrl =
      "your_api_key";

  double result = 0;
  double? usCurrencyRate = 83;

  Future<void> apicall() async {
    final response = await http.get(Uri.parse(currencyUrl));
    if (response.statusCode == 200) {
      final mapResponse = jsonDecode(response.body);
      final mapDataResponse = mapResponse['quotes'];
      setState(() {
        usCurrencyRate = (mapDataResponse?['USDINR'] as num?)?.toDouble();
      });
    } else if (response.statusCode != 200) {
      setState(
        () {
          usCurrencyRate = 81;
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    apicall();
  }

  @override
  Widget build(BuildContext context) {
    const OutlineInputBorder border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 2,
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignCenter,
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Currency Converter"),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            child: Image.asset("assets/images/dollar.png"),
          ),
          const SizedBox(height: 20),
          usCurrencyRate == null
              ? const Text("Fetching Currency value")
              : Text(
                  "Current USD Rate: ${usCurrencyRate!}",
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
          Center(
            child: Text(
              "₹$result",
              style: const TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                focusedBorder: border,
                filled: true,
                fillColor: Colors.white,
                hintText: "Please enter currency in dollar",
                hintStyle: TextStyle(color: Colors.black),
                enabledBorder: border,
                prefixIcon: Icon(Icons.monetization_on, color: Colors.black),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    final input =
                        double.tryParse(textEditingController.text) ?? 0;
                    if (usCurrencyRate != null) {
                      result = input * usCurrencyRate!;
                    }
                  });
                },
                style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                ),
                child: const Text("Convert",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
