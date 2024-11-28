import 'package:flutter/material.dart';

import '../signup/register_screen.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final VoidCallback press;

  const AlreadyHaveAnAccountCheck({Key? key, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen() ),);
      },
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.black),
          children: [
            TextSpan(
              text: "Don't have an account? ",
              style: TextStyle(fontSize: 16),
            ),
            TextSpan(
              text: "Sign Up",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

