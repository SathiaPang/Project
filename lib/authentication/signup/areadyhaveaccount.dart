import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheckSignUp extends StatelessWidget {
  final bool login;
  final VoidCallback press;

  const AlreadyHaveAnAccountCheckSignUp({
    Key? key,
    required this.login,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.red),
          children: [
            TextSpan(
              text: login
                  ? "Don't have an account? "
                  : "Already have an account? ",
              // style: TextStyle(fontSize: ),
            ),
            TextSpan(
              text: login ? "Sign Up" : "Login",
              style: TextStyle(
                // fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
