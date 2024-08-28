import 'package:convertor/auth/login_screen.dart';
import 'package:convertor/services/authentication.dart';
import 'package:convertor/widgets/button.dart';
import 'package:convertor/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool _isLoading = false; // State variable to track loading

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: CustomAppBar(
        countryIcon: false,
        title: 'Profile',
        showBackButton: true,
        showLogOutButton: false,
        walletIcon: false,
        showCoins: false,
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator() // Show loading indicator when _isLoading is true
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "You are logged in as 'Name'",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Button(
                      buttonText: 'Logout',
                      onPress: () async {
                        setState(() {
                          _isLoading = true;
                        });

                        // Simulate a delay for showing the progress indicator
                        await Future.delayed(Duration(seconds: 1));

                        await Authentication().logOutUser();

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
