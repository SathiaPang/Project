import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtons extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const CustomButtons({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(Get.width * 0.02), // Adjust padding as needed
          child: Container(
            height: Get.height * 0.1, // Adjust the height as needed
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  Get.width * 0.05), // Adjust the border radius as needed
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize:
                        Get.width * 0.04, // Adjust the font size as needed
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
