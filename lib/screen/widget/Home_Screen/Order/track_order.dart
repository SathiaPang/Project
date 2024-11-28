import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'order_recive.dart';

class TrackOrder extends StatelessWidget {
  const TrackOrder({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.deepPurpleAccent.withOpacity(0.1),
                      radius: Get.width * 0.3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 40),
                        child: Center(
                          child: Image.asset(
                              'lib/assets/images/drink/delivery-food.gif'),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: Get.height * 0.23,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: Get.width,
                    height: Get.height * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(top: BorderSide(color: Colors.black)),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Your Food is on the way.',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  decoration: TextDecoration.none),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            Text(
              'Thank you for your order! you can track \n    the delivery in "order" section. ',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  decoration: TextDecoration.none),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            Text(
              'Est. Delivery Time:24 min',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 18,
                  decoration: TextDecoration.none),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            _buildDoneButton(color: Colors.red, text: Text('Track My Order'))
          ],
        ),
      ),
    );
  }

  GestureDetector _buildDoneButton({
    required Color color,
    required Text text,
  }) {
    return GestureDetector(
      onTap: () {
        // Uncomment the following line if you want to navigate to a new screen.
        Get.to(Location());
        Get.snackbar('Delivery', "Please waiting we are on the way");
      },
      child: SizedBox(
        width: Get.width * 0.8, // Responsive width
        height: Get.height * 0.06, // Responsive height
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(
                Get.width * 0.03), // Responsive border radius
          ),
          child: Center(
            child: Text(
              text.data ?? "", // Extracting text data from the Text widget
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Get.width * 0.04,
                  decoration: TextDecoration.none // Responsive font size
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
