import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:individual_project/screen/widget/Menu_List/Category/item_view_cart.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/images/drink/google-maps-pin.gif'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: Get.height / 30),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                width: double.infinity,
                height: Get.height / 2,
                color: Colors.white.withOpacity(0.8),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                          width: double.infinity,
                          height: Get.height / 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  height: Get.height / 15,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                        'lib/assets/images/heathom.png'),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Panha SOUT',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      'Your food man',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: Get.width / 4,
                                ),
                                Container(
                                  margin: EdgeInsets.all(Get.width *
                                      0.05), // Adjusted margin value
                                  width: Get.width / 8,
                                  height: Get.height / 15,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2.0, color: Colors.red),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        10.0,
                                      ),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.phone,
                                    size: Get.width * 0.07,
                                    color: Colors.red,
                                  ),
                                ),
                              ])),
                      SizedBox(
                        height: Get.height / 50,
                      ),
                      Container(
                        width: double.infinity,
                        height: Get.height / 13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.access_time_outlined,
                              color: Colors.red,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Est.Delivery Time: 2 mins',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height / 50,
                      ),
                      Container(
                        width: double.infinity,
                        height: Get.height / 13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.pin_drop_outlined,
                              color: Colors.red,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '123 Golden Street,Phnom Penh',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height / 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.find<Item_Controller>().placeOrder();
                          Get.snackbar(
                              'Order', "Order success thank fo your order ");
                        },
                        child: SizedBox(
                          width: Get.width * 0.8, // Responsive width
                          height: Get.height * 0.06, // Responsive height
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(
                                  Get.width * 0.03), // Responsive border radius
                            ),
                            child: Center(
                              child: Text(
                                "Order Recieved", // Extracting text data from the Text widget
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Get.width * 0.04,
                                    decoration: TextDecoration
                                        .none // Responsive font size
                                    ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
