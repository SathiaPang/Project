import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:individual_project/controller/history_controller.dart';
import 'package:individual_project/screen/widget/Home_Screen/Order/orderDetail.dart';

class MyOrder extends StatelessWidget {
  MyOrder({super.key});

  final AddToHistoryController _historyController =
      Get.put(AddToHistoryController());

  @override
  Widget build(BuildContext context) {
    _historyController.getAllHistory();

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
      body: Obx(() => _buildOnlinePage()),
    );
  }

  Widget _buildOnlinePage() {
    return ListView.builder(
      itemCount: _historyController.foodlisthistory.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final foodhistory = _historyController.foodlisthistory[index];
        return GestureDetector(
          onTap: () {
            Get.to(OrderDetail(history: foodhistory));
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            padding: EdgeInsets.all(10),
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Date: ${foodhistory.orderDate}",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Quantity: ${foodhistory.qty.toString()}",
                  style: TextStyle(
                    fontSize: Get.height * 0.02,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Total : ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                            ),
                          ),
                          TextSpan(
                            text: '\$ ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                            ),
                          ),
                          TextSpan(
                            text: foodhistory.price.toStringAsFixed(2),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
