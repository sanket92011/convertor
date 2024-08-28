import 'package:convertor/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:convertor/widgets/coins_card.dart';

import 'currency_convertor.dart';

class BuyCoins extends StatefulWidget {
  BuyCoins({super.key});

  @override
  State<BuyCoins> createState() => _BuyCoinsState();
}

class _BuyCoinsState extends State<BuyCoins> {
  void _updateCoins(int coins) {
    setState(() {
      totalCoins += coins;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: CustomAppBar(
        countryIcon: false,
        walletIcon: false,
        title: 'Buy Coins',
        showBackButton: true,
        showLogOutButton: false,
        showCoins: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          CoinsCard(
            coins: 50,
            onPurchase: _updateCoins,
          ),
          const SizedBox(height: 20),
          CoinsCard(
            coins: 100,
            onPurchase: _updateCoins,
          ),
          const SizedBox(height: 20),
          CoinsCard(
            coins: 250,
            onPurchase: _updateCoins,
          ),
        ],
      ),
    );
  }
}
