import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {}

class NotificationList extends StatelessWidget {
  const NotificationList({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'New',
            style: TextStyle(
                fontSize: Get.width * 0.05, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: Get.height * 0.02,
        ),
        Expanded(
          child: GetBuilder<NotificationController>(
            init: NotificationController(),
            builder: (controller) {
              return ListView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(4, (index) => buildNoti()));
            },
          ),
        ),
      ],
    );
  }

  Widget buildNoti() {
    return GestureDetector(
      onTap: () {},
      child: GetBuilder<NotificationController>(builder: (controller) {
        return Container(
          height: Get.height * 0.12,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Get.width * 0.05),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                spreadRadius: Get.width * 0.005,
                blurRadius: Get.width * 0.01,
                // offset: Offset(0, Get.width * 0.015),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(left: Get.width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: Get.width * 0.05,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Text(
                  "From international cuisines to quick and easy meal ideas.",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: Get.width * 0.03,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
