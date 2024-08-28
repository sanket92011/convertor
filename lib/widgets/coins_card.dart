import 'package:flutter/material.dart';

import '../pages/currency_convertor.dart';

class CoinsCard extends StatefulWidget {
  final int coins;

  var onPurchase;

  CoinsCard({Key? key, required this.coins, required this.onPurchase})
      : super(key: key);

  @override
  State<CoinsCard> createState() => _CoinsCardState();
}

class _CoinsCardState extends State<CoinsCard> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Center(
      child: SizedBox(
        height: 50,
        width: screenWidth * 0.9,
        child: Center(
          child: Container(
            color: Colors.orange.shade200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const SizedBox(width: 10),
                Text(
                  "Top up for ${widget.coins} coins",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    widget.onPurchase(widget.coins);
                  },
                  child: const Text(
                    "Buy now",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
