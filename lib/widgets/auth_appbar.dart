import 'package:flutter/material.dart';

class AuthAppbar extends StatelessWidget implements PreferredSizeWidget {
  AuthAppbar({super.key, required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.blueGrey,
      title: Center(
        child: Text(title),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
