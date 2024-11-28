import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:individual_project/controller/fav_controller.dart';
import 'package:individual_project/data/data.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key, required this.food}) : super(key: key);

  final FoodRepo food;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final FavController _controller = Get.put(FavController());

  @override
  Widget build(BuildContext context) {
    _controller.initData(widget.food);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          GetBuilder<FavController>(
            builder: (_) {
              return IconButton(
                icon: Icon(
                  _controller.favIconState
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: () {
                  _controller.saveFavItem(widget.food);
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: Get.height * 0.3,
              child: Image.asset(widget.food.image),
            ),
            SizedBox(
              height: Get.height / 20,
            ),
            // Botton QTY
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Botton -
                Center(
                  child: Container(
                    transform: Matrix4.rotationZ(45 * 3.1415927 / 180),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 243, 0, 0),
                      borderRadius: BorderRadius.circular(Get.width * 0.03),
                    ),
                    transformAlignment: Alignment.center,
                    child: Transform.rotate(
                      angle: 5.5,
                      child: IconButton(
                          onPressed: () {
                            _controller.update();
                            setState(() {
                              if (widget.food.qty > 0) {
                                widget.food.qty--;
                              }
                            });
                          },
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
                // Number count
                SizedBox(
                  width: 15,
                ),
                Container(
                    child: Text(
                  "${widget.food.qty}",
                  style: TextStyle(fontSize: 25),
                )),
                // Bottpn +
                SizedBox(
                  width: 15,
                ),
                Center(
                  child: Container(
                    transform: Matrix4.rotationZ(45 * 3.1415927 / 180),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 243, 0, 0),
                      borderRadius: BorderRadius.circular(Get.width * 0.03),
                    ),
                    transformAlignment: Alignment.center,
                    child: Transform.rotate(
                      angle: 5.5,
                      child: IconButton(
                          onPressed: () {
                            // _controller.increQty();
                            _controller.update();
                            setState(() {
                              widget.food.qty++;
                            });
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          )),
                    ),
                  ),
                )
              ],
            ),

            ////////
            SizedBox(
              height: Get.height * 0.02,
            ),
            Container(
              padding: EdgeInsets.all(Get.width * 0.01),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: Get.width * 0.01,
                    blurRadius: Get.width * 0.01,
                    offset: Offset(0, Get.width * 0.005),
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: Get.height * 0.025, left: Get.width * 0.024),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Text(
                      "Fast Food",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: Get.width * 0.04,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.food.subtitle,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: Get.width * 0.04,
                            ),
                            SizedBox(
                              height: Get.width * 0.015,
                            ),
                            Text(
                              '4.5',
                              style: TextStyle(
                                fontSize: Get.width * 0.08,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.02,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      widget.food.detail,
                      style: TextStyle(
                          fontSize: Get.width * 0.03,
                          color: Colors.grey.shade400),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Row(
                      children: [
                        Text(
                          'Delivery',
                          style: TextStyle(
                              fontSize: Get.width * 0.05, color: Colors.black),
                        ),
                        SizedBox(
                          width: Get.width * 0.1,
                        ),
                        Icon(
                          Icons.access_time,
                          color: Colors.red,
                        ),
                        Text(
                          '25 mins',
                          style: TextStyle(
                              fontSize: Get.width * 0.05, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height / 60,
                    ),
                    Text(
                      'Total Price',
                      style: TextStyle(
                          fontSize: Get.width * 0.03, color: Colors.black),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.028,
                          vertical: Get.height * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _controller.saveToCart(widget.food);
                              Get.snackbar(
                                  'Notification', 'Add to cart successful');
                            },
                            child: Center(
                              child: Container(
                                width: Get.width * 0.15,
                                height: Get.height * 0.07,
                                transform:
                                    Matrix4.rotationZ(45 * 3.1415927 / 180),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 243, 0, 0),
                                  borderRadius:
                                      BorderRadius.circular(Get.width * 0.03),
                                ),
                                transformAlignment: Alignment.center,
                                child: Transform.rotate(
                                  angle: 5.5,
                                  child: Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Colors.white,
                                    size: Get.width * 0.08,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
