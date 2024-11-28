import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:individual_project/controller/fav_controller.dart';
import 'package:individual_project/data/data.dart';
import '../../../../repositary/repo_controller.dart';

class ItemController extends GetxController {
  final productStorage = ProductStorage.instance;
  final favList = <FoodRepo>[].obs;
}

class Item_List extends StatefulWidget {
  Item_List({Key? key}) : super(key: key);

  @override
  State<Item_List> createState() => _Item_ListState();
}

class _Item_ListState extends State<Item_List> {
  final FavController _favController = Get.put(FavController());
  final ItemController _itemController = Get.put(ItemController());
  @override
  void initState() {
    _favController.getProductFavItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        itemCount: _favController.favItems.length,
        itemBuilder: (context, index) {
          return buildItemCard(
            _favController.favItems[index],
          );
        },
      ),
    );
  }

  Widget buildItemCard(FoodRepo foodRepo) {
    return GetBuilder<ItemController>(
      init: _itemController,
      builder: (controller) {
        return Slidable(
          endActionPane: ActionPane(
            motion: BehindMotion(),
            children: [
              SizedBox(
                width: 5,
              ),
              SlidableAction(
                onPressed: (context) {
                  _favController.saveToCart(foodRepo);
                  print('Add Success');
                },
                backgroundColor: Colors.green,
                icon: Icons.shopping_cart_outlined,
                autoClose: true,
                borderRadius: BorderRadius.circular(10),
              ),
              SizedBox(
                width: 5,
              ),
              SlidableAction(
                onPressed: (context) {
                  _favController.deleteFavItem(foodRepo);
                },
                backgroundColor: Colors.red,
                icon: Icons.delete,
                spacing: 12,
                autoClose: true,
                borderRadius: BorderRadius.circular(10),
              ),
            ],
          ),
          child: Container(
            height: Get.height * 0.15, // Responsive height
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
              padding: EdgeInsets.only(
                top: Get.height * 0.02,
                left: Get.width * 0.02,
              ),
              child: Row(
                children: [
                  Container(
                    width: Get.width * 0.3, // Responsive width
                    child: Image.asset(foodRepo.image),
                  ),
                  SizedBox(
                    width: Get.width / 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        foodRepo.subtitle,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: Get.height / 50, // Responsive font size
                        ),
                      ),
                      Text(
                        'Golden brown fried chicken',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                          fontSize: Get.height / 80, // Responsive font size
                        ),
                      ),
                      SizedBox(
                        height: Get.height / 50,
                      ),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '\$ ',
                                  style: TextStyle(
                                    fontSize: Get.height *
                                        0.02, // Responsive font size
                                    color: Colors.red,
                                  ),
                                ),
                                TextSpan(
                                  text: foodRepo.price.toString(),
                                  style: TextStyle(
                                    fontSize: Get.height *
                                        0.03, // Responsive font size
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: Get.width / 10,
                          ),
                          Container(
                            child: RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize:
                                  Get.height * 0.02, // Responsive font size
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
