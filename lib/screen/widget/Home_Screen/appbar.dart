import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({
    Key? key,
    required GlobalKey<ScaffoldState> scaffoldKey, // Correct parameter name
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: SizedBox(
        height: Get.height / 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Container(
                width: Get.width * 0.1,
                height: Get.height * 0.05,
                transform: Matrix4.rotationZ(45 * 3.1415927 / 180),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 243, 0, 0),
                  borderRadius: BorderRadius.circular(10),
                ),
                transformAlignment: Alignment.center,
                child: Transform.rotate(
                  angle: 5.5,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.menu,
                      size: 28,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
