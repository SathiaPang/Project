import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:individual_project/controller/splashScreen.dart';

class SlashScreen extends StatefulWidget {
  const SlashScreen({Key? key}) : super(key: key);

  @override
  State<SlashScreen> createState() => _SlashScreenState();
}

SplashController _controller = Get.put(SplashController());

class _SlashScreenState extends State<SlashScreen> {
  @override
  void initState() {
    _controller.intiSplashScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: Colors.redAccent,
            ),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'lib/assets/images/logo_mobile.jpg',
                width: screenSize.width * 0.6,
                height: screenSize.height * 0.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
