import 'package:flutter/material.dart';
import '../../authentication/loginndSignupbtn.dart';

class LoginRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            welcome(screenSize),
            Text(
              'Welcome',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenSize.width * 0.1, // Adjust font size
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 255, 0, 0),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.02, // Adjust spacing
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1), // Adjust padding
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus et felis dolor, Donec vitae facilisis velit.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenSize.width * 0.05, // Adjust font size
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.1, // Adjust spacing
            ),
            Loginandsignupbtn(),
          ],
        ),
      ),
    );
  }

  Widget welcome(Size screenSize) {
    return SizedBox(
      height: screenSize.height * 0.4, // Adjust height
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            'lib/assets/images/buger.png',
            fit: BoxFit.contain,
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.white]),
            ),
          ),
          SizedBox(
            child: Image.asset(
              'lib/assets/images/284-removebg-preview.png',
              width: screenSize.width * 0.5, // Adjust width
            ),
          )
        ],
      ),
    );
  }
}
