import 'package:convertor/auth/sign_up.dart';
import 'package:convertor/pages/currency_convertor.dart';
import 'package:flutter/material.dart';

import '../services/authentication.dart';
import '../widgets/auth_appbar.dart';
import '../widgets/button.dart';
import '../widgets/snackbar.dart';
import '../widgets/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginUser() async {
    String result = await Authentication().loginUser(
      email: emailController.text,
      password: passwordController.text,
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
        title: 'Login',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextfield(
              hintText: "Email",
              fieldIcon: const Icon(Icons.email),
              textEditingController: emailController,
              isPassword: false,
            ),
            const SizedBox(height: 20),
            CustomTextfield(
              hintText: "Password",
              fieldIcon: const Icon(
                Icons.password,
              ),
              textEditingController: passwordController,
              isPassword: true,
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot password?",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Button(buttonText: 'Login', onPress: loginUser),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        ));
                  },
                  child: const Text(
                    " Register now",
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
