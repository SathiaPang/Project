import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:individual_project/screen/widget/Home_Screen/Order/select_card.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int? selectedValue; // Add this line to track the selected value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Method'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: Get.height / 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(Get.width * 0.02),
              child: Container(
                height: Get.height * 0.07,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Get.width * 0.02),
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
                child: Padding(
                  padding: EdgeInsets.all(Get.width * 0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Credit, debit Card',
                            style: TextStyle(
                                fontSize: Get.width * 0.04,
                                fontWeight: FontWeight.w400),
                          ),
                          Transform.scale(
                            scale: Get.width * 0.003,
                            child: Radio<int>(
                              value: 1, // Different value for the first Radio
                              groupValue: selectedValue,
                              activeColor: Colors.red,
                              onChanged: (int? value) {
                                setState(() {
                                  selectedValue = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height / 80),
            Padding(
              padding: EdgeInsets.all(Get.width * 0.02),
              child: Container(
                height: Get.height * 0.07,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Get.width * 0.02),
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
                child: Padding(
                  padding: EdgeInsets.all(Get.width * 0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'PayPal',
                            style: TextStyle(fontSize: Get.width * 0.04),
                          ),
                          Transform.scale(
                            scale: Get.width * 0.003,
                            child: Radio<int>(
                              value: 2, // Different value for the second Radio
                              groupValue: selectedValue,
                              activeColor: Colors.red,

                              onChanged: (int? value) {
                                setState(() {
                                  selectedValue = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height / 80),
            Padding(
              padding: EdgeInsets.all(Get.width * 0.02),
              child: Container(
                height: Get.height * 0.07,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Get.width * 0.02),
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
                child: Padding(
                  padding: EdgeInsets.all(Get.width * 0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cash on Delivery',
                            style: TextStyle(fontSize: Get.width * 0.04),
                          ),
                          Transform.scale(
                            scale: Get.width * 0.003,
                            child: Radio<int>(
                              value: 3, // Different value for the second Radio
                              groupValue: selectedValue,
                              activeColor: Colors.red,

                              onChanged: (int? value) {
                                setState(() {
                                  selectedValue = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height / 10),
            GestureDetector(
              onTap: () {
                Get.to(creditCard());
              },
              child: SizedBox(
                child: Container(
                  width: Get.width * 0.8, // Responsive width
                  height: Get.height * 0.06, // Responsive height
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(
                        Get.width * 0.03), // Responsive border radius
                  ),
                  child: Center(
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Get.width * 0.04, // Responsive font size
                      ),
                    ),
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
