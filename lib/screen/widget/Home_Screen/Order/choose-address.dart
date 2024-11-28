import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  int? selectedValue; // Add this line to track the selected value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Address'),
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
                height: Get.height * 0.15,
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
                  padding: EdgeInsets.only(bottom: 10,left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'My Home Address',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          Transform.scale(
                            scale: Get.width * 0.003,
                            child: Radio<int>(
                              value: 1,
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
                      Text(
                        'Home',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      Text(
                        '(503) 123 456 789 Phsar Deoum Kor, Samdech Munireth Boulevard (Street 217), Khan Boeng Keng Kang',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height / 80),
            Padding(
              padding: EdgeInsets.all(Get.width * 0.02),
              child: Container(
                height: Get.height * 0.15,
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
                  padding: EdgeInsets.only(bottom: 10,left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'My Office Address',
                            style: TextStyle(fontSize: 16),
                          ),
                          Transform.scale(
                            scale: Get.width * 0.003,
                            child: Radio<int>(
                              value: 2, 
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
                      Text(
                        'Office',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      Text(
                        '(503) 123 456 789 Phsar Deoum Kor, Samdech Munireth Boulevard (Street 217), Khan Boeng Keng Kang',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
              ),
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
                  'Add New Address',
                  style:
                      TextStyle(color: Colors.red, fontSize: Get.width * 0.04),
                ),
              ]),
            ),
            SizedBox(height: Get.height / 10),
            GestureDetector(
              onTap: () {
                Get.back();
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
                      'Done',
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
