import 'dart:convert';

import 'package:convertor/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CurrencyConvertor extends StatefulWidget {
  const CurrencyConvertor({super.key});

  @override
  State<CurrencyConvertor> createState() => _CurrencyConvertorState();
}

int totalCoins = 100;
var mapresponse;
double? currencyRate = 81;

var selectedCurrency = mapresponse['quotes'];

class _CurrencyConvertorState extends State<CurrencyConvertor> {
  final TextEditingController textEditingController = TextEditingController();

  double result = 0;

  String url =
      'https://api.currencylayer.com/live?access_key=0002c0676ab6f19af3a7e029031f77f7&format=1';
  final border = const OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  );

  void convert() {
    result = double.parse(textEditingController.text) * currencyRate!;
  }

  Future apicall() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      mapresponse = jsonDecode(response.body);
      selectedCurrency = mapresponse['quotes'];
      setState(
        () {
          currencyRate = (selectedCurrency?["USDINR"] as num?)!.toDouble();
        },
      );
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        countryIcon: true,
        walletIcon: true,
        title: ("Currency Convertor"),
        showBackButton: false,
        showLogOutButton: true,
        showCoins: true,
      ),
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            " 1\$ = $currencyRate ₹",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Center(
            child: Text(
              "$result",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                border: border,
                focusedBorder: border,
                prefixIcon: const Icon(Icons.monetization_on),
                hintText: "Enter currency to convert",
                filled: true,
                fillColor: Colors.white,
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              keyboardType: const TextInputType.numberWithOptions(),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                onPressed: () {
                  if (textEditingController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please enter currency")));
                  } else {
                    if (totalCoins <= 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please recharge"),
                        ),
                      );
                    } else {
                      convert();
                      setState(() {});
                      if (textEditingController.text ==
                          textEditingController.text) {
                        totalCoins = totalCoins;
                      }
                      totalCoins -= 10;
                    }
                  }
                },
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.black),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                child: const Text(
                  "Convert",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
