import 'package:flutter/material.dart';
import 'login/login_screen.dart';
import 'signup/register_screen.dart';

class Loginandsignupbtn extends StatefulWidget {
  const Loginandsignupbtn({Key? key}) : super(key: key);

  @override
  State<Loginandsignupbtn> createState() => _LoginandsignupbtnState();
}

class _LoginandsignupbtnState extends State<Loginandsignupbtn> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          width: screenSize.width * 0.8, // Adjust width based on screen width
          height:
              screenSize.height * 0.06, // Adjust height based on screen height
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 243, 33, 33),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "Login".toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: screenSize.width * 0.8, // Adjust width based on screen width
          height:
              screenSize.height * 0.06, // Adjust height based on screen height
          child: OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              side: BorderSide(
                width: 2.5,
                color: Color.fromARGB(255, 255, 0, 0),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "Sign Up".toUpperCase(),
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 0, 0),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
