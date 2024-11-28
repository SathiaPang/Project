import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:individual_project/model/history.dart';

class OrderDetail extends StatelessWidget {
  OrderDetail({Key? key, required this.history}) : super(key: key);

  final History history;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail')),
      body: _buildDetailHistory(),
      bottomNavigationBar: _builTotalAmount(),
    );
  }

  Widget _buildDetailHistory() {
    return ListView.builder(
      itemCount: history
          .items.length, // Assuming history has a property named foodList
      itemBuilder: (context, index) {
        final foodRepo = history
            .items[index]; // Assuming each item in foodList is a HistoryItem
        return Container(
          height: Get.height * 0.15,
          margin: EdgeInsets.all(Get.width * 0.03),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Get.width * 0.06),
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
            padding: EdgeInsets.only(top: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset(
                      foodRepo.image), // Replace with the actual image property
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 150),
                      child: Text(
                        "${foodRepo.qty}\u00D7",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: Get.height * 0.025,
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: foodRepo.subtitle,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: Get.height / 50,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height * 0.005),
                    Text(
                      foodRepo
                          .category, // Replace with the actual description property
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        fontSize: Get.height / 80,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.005),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '\$ ',
                                style: TextStyle(
                                    fontSize: Get.height * 0.02,
                                    color: Colors.red),
                              ),
                              TextSpan(
                                text: foodRepo.price.toString(),
                                style: TextStyle(
                                    fontSize: Get.height * 0.03,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
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

  Widget _builTotalAmount() => Container(
        height: Get.height * 0.15,
        margin: EdgeInsets.all(Get.width * 0.03),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Get.width * 0.06),
          color: Colors.red,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              spreadRadius: Get.width * 0.01,
              blurRadius: Get.width * 0.01,
              offset: Offset(0, Get.width * 0.005),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Total Amount :",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text("\$ ${history.price.toStringAsFixed(2)}",
                style: TextStyle(color: Colors.white, fontSize: 20))
          ],
        ),
      );
}
