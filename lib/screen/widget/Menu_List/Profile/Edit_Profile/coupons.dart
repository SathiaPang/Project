import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponsScreen extends StatelessWidget {
  const CouponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Order'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          
          children: [
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.deepPurpleAccent.withOpacity(0.1),
                    radius: Get.width * 0.3,
                    child: Center(
                        child: Image.asset(
                      'lib/assets/images/coupons.png',
                      color: Colors.red,
                      height: 100,
                    )), // Adjust the radius as needed
                  ),
                ],
              ),
              Positioned(
                top: Get.height * 0.23,
                left: 0,
                right: 0,
                child: Container(
                  width: Get.width,
                  height: Get.height * 0.6, // Adjust the height as needed
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(top: BorderSide(color: Colors.black)),
                  ),
                ),
              ),
            ],
          ),
          Text(
            " You don't have coupon.",
            style: TextStyle(color: Colors.red, fontSize: 25,fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: Get.height /10,
          ),
          Container(
              margin: EdgeInsets.all(Get.width * 0.05), // Adjusted margin value
              width: Get.width * 0.5,
              height: Get.height / 15,
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.red),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10.0,
                  ),
                ),
              ),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(
                  Icons.add,
                  size: Get.width * 0.07,
                  color: Colors.red,
                ),
                Text(
                  'Add Coupon',
                  style:
                      TextStyle(color: Colors.red, fontSize: Get.width * 0.04),
                ),
              ]),
            ),
        ]),
      ),
    );
  }
}
