import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:individual_project/screen/widget/Home_Screen/Order/choose-address.dart';
import 'package:individual_project/screen/widget/Home_Screen/Order/payment-method.dart';

class Order_Screen extends StatelessWidget {
  const Order_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Get.height / 50,
        ),
        child: Column(children: [
          InkWell(
            onTap: () {
              Get.to(() => Address());
            },
            child: Padding(
              padding:
                  EdgeInsets.all(Get.width * 0.02), // Adjust padding as needed
              child: Container(
                height: Get.height * 0.08, // Adjust the height as needed
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Choose Address',
                      style: TextStyle(
                        fontSize: Get.width * 0.04,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.35,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => Payment());
            },
            child: Padding(
              padding:
                  EdgeInsets.all(Get.width * 0.02), // Adjust padding as needed
              child: Container(
                height: Get.height * 0.08, // Adjust the height as needed
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Payment Method',
                      style: TextStyle(
                        fontSize: Get.width * 0.04,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.35,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
