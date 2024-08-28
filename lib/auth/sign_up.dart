import 'package:convertor/auth/login_screen.dart';
import 'package:convertor/pages/currency_convertor.dart';
import 'package:convertor/services/authentication.dart';
import 'package:convertor/widgets/auth_appbar.dart';
import 'package:convertor/widgets/button.dart';
import 'package:convertor/widgets/snackbar.dart';
import 'package:convertor/widgets/textfield.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
    name.dispose();
  }

  void singUpUser() async {
    String result = await Authentication().signUpUser(
      email: email.text,
      password: password.text,
      name: name.text,
    );
    if (result == "Success") {
      setState(() {
        isLoading = true;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CurrencyConvertor(),
          ));
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AuthAppbar(
        title: 'Sign-up',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextfield(
              hintText: "Enter your name",
              fieldIcon: const Icon(Icons.abc),
              textEditingController: name,
              isPassword: false,
            ),
            const SizedBox(height: 10),
            CustomTextfield(
              hintText: "Email",
              fieldIcon: const Icon(Icons.abc),
              textEditingController: email,
              isPassword: false,
            ),
            const SizedBox(height: 10),
            CustomTextfield(
              hintText: "Password",
              fieldIcon: const Icon(Icons.abc),
              textEditingController: password,
              isPassword: true,
            ),
            const SizedBox(height: 40),
            Button(buttonText: "Sign up", onPress: singUpUser),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                  },
                  child: const Text(
                    " Login now",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
