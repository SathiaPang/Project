import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:individual_project/screen/widget/Home_Screen/detail_screen.dart';
import '../../../data/data.dart';

class Item_View extends StatelessWidget {
  const Item_View({
    Key? key,
    required this.food,
  }) : super(key: key);

  final FoodRepo food;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.to(() => DetailScreen(
                food: food,
              ));
        },
        child: Container(
          height: double.infinity,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: Get.height * 0.35,
                width: Get.width * 0.5,
                margin: EdgeInsets.symmetric(
                    horizontal: Get.width / 60), // Adjust the width as needed
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        child: Image.asset(
                          food.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      food.subtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Chicken Popcorn",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: Get.height / 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Text(
                          '5',
                          style: TextStyle(fontSize: 17, color: Colors.amber),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Get.height / 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '\$ ',
                              style: TextStyle(fontSize: 20, color: Colors.red),
                            ),
                            TextSpan(
                              text: food.price.toString(),
                              style:
                                  TextStyle(fontSize: 30, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
