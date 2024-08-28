import 'package:convertor/pages/currency_convertor.dart';
import 'package:convertor/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class CountriesList extends StatelessWidget {
  CountriesList({super.key});

  final Map<String, dynamic> currencyListResponse = mapresponse['quotes'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: CustomAppBar(
        countryIcon: false,
        walletIcon: false,
        title: ("Currency list"),
        showBackButton: true,
        showLogOutButton: false,
        showCoins: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: ListView.builder(
          itemCount: currencyListResponse.length,
          itemBuilder: (context, int index) {
            final currencyCode = currencyListResponse.keys.elementAt(index);
            final currencyValue = currencyListResponse[currencyCode];
            return Card(
                elevation: 20,
                child: ListTile(
                  title: Row(
                    children: [
                      Text(currencyCode),
                      const Spacer(),
                      Text("$currencyValue")
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }
}
