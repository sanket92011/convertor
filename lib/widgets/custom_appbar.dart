import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../pages/buy_coins.dart';
import '../pages/countries_list.dart';
import '../pages/currency_convertor.dart';
import '../pages/user_profile.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    super.key,
    required this.countryIcon,
    required this.walletIcon,
    required this.title,
    required this.showBackButton,
    required this.showLogOutButton,
    required this.showCoins,
  });

  final bool countryIcon;
  final bool walletIcon;
  final String title;
  bool showBackButton;
  bool showLogOutButton;
  bool showCoins;

  Future<bool> get hasInternet => InternetConnection().hasInternetAccess;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: showBackButton == true ? true : false,
      backgroundColor: Colors.blueGrey,
      title: Row(
        children: [
          showLogOutButton
              ? IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserProfile(),
                        ));
                  },
                  icon: Icon(Icons.account_circle))
              : SizedBox(),
          Text(title),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: showCoins
              ? Text(
                  "$totalCoins",
                )
              : SizedBox(),
        ),
        walletIcon
            ? IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BuyCoins()),
                  );
                },
                icon: const Icon(
                  Icons.wallet,
                  color: Colors.black45,
                ),
              )
            : const SizedBox(),
        FutureBuilder<bool>(
          future: hasInternet,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox();
            } else if (snapshot.hasError) {
              return const SizedBox();
            } else if (snapshot.hasData && snapshot.data == true) {
              return countryIcon
                  ? IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CountriesList(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.language_sharp,
                        color: Colors.black45,
                      ),
                    )
                  : const SizedBox();
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
