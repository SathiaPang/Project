import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:individual_project/screen/widget/Home_Screen/Order/order_screen.dart';
import 'package:individual_project/screen/widget/Menu_List/Category/item_view_cart.dart';

class Cart_Screen extends StatefulWidget {
  @override
  State<Cart_Screen> createState() => _Cart_ScreenState();
}

class _Cart_ScreenState extends State<Cart_Screen> {
  final Item_Controller _cartController = Get.put(Item_Controller());

  @override
  void initState() {
    _cartController.countTotal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: GetBuilder<Item_Controller>(
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.swap_horiz_sharp,
                      color: Colors.black,
                      size: 25,
                    ),
                    SizedBox(width: 5),
                    Text('swipe on an item to delete',
                        style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
              Expanded(
                child: Item_List(),
              ),
              // OrderBox(),
              Container(
                height: Get.height * 0.2, // Responsive height
                margin: EdgeInsets.all(Get.width * 0.03), // Responsive margin
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      Get.width * 0.06), // Responsive border radius
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      spreadRadius: Get.width * 0.01,
                      blurRadius: Get.width * 0.01,
                      offset: Offset(0, Get.width * 0.005),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Get.height / 40,
                      horizontal: Get.width * 0.08), // Responsive padding
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery Time ',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight:
                                    FontWeight.w500), // Responsive font size
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                color: Colors.red,
                              ),
                              SizedBox(width: Get.width / 80),
                              Text(
                                '25 mins',
                                style: TextStyle(
                                  // fontSize: , // Responsive font size
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.02, // Responsive height
                      ),
                      Text("Total Price",
                          style: TextStyle(
                              fontWeight:
                                  FontWeight.w500)), // Responsive font size
                      SizedBox(
                        height: Get.height * 0.01, // Responsive height
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '\$',
                                  style: TextStyle(
                                      // fontSize: Get.width * 0.04,
                                      color:
                                          Colors.red), // Responsive font size
                                ),
                                TextSpan(
                                  text: _cartController
                                      .countTotal()
                                      .toStringAsFixed(2),
                                  style: TextStyle(
                                      fontSize: 26,
                                      color:
                                          Colors.black), // Responsive font size
                                ),
                              ],
                            ),
                          ),
                          // Text(_cartController.countTotal().toString()),
                          GestureDetector(
                            onTap: () {
                              double total = _cartController.countTotal();
                              if (total > 0) {
                                Get.to(Order_Screen());
                              } else {
                                Get.snackbar(
                                  "Cannot Order",
                                  "Please add items to your cart.",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                );
                              }
                            },
                            child: SizedBox(
                              child: Container(
                                width: Get.width * 0.4, // Responsive width
                                height: Get.height * 0.06, // Responsive height
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(
                                      Get.width *
                                          0.03), // Responsive border radius
                                ),
                                child: Center(
                                  child: Text(
                                    'Place Order',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
