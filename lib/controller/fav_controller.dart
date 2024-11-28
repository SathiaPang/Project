import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:individual_project/data/data.dart';
import 'package:individual_project/repositary/repo_controller.dart';

class FavController extends GetxController {
  final productDetails = <FoodRepo>[].obs;
  final favItems = <FoodRepo>[].obs;
  final Map<String, RxInt> itemCounts = {};
  final productStorage = ProductStorage.instance;
  var favIconState = false;
  var totalOrderQty = 0.obs;
  RxInt count = 0.obs;

  void initData(FoodRepo foodRepo) async {
    favIconState = await isContain(foodRepo);
    update();
  }

  Future<List<FoodRepo>> getAllProducts() async =>
      productStorage.getProductItems("FavItems");
  Future<bool> isContain(FoodRepo foodRepo) async {
    final allList = await getAllProducts();
    return allList.any((element) =>
        element.subtitle == foodRepo.subtitle &&
        element.price == foodRepo.price);
  }

  void saveFavItem(FoodRepo foodRepo) async {
    final isExist = await isContain(foodRepo);
    if (isExist) {
      deleteFavItem(foodRepo);
      favIconState = false;
      update();
      return;
    } else {
      final isSave = await productStorage.putFoodDetail(foodRepo, "FavItems");
      favIconState = isSave;
      update();
    }
  }

  void getProductFavItem() async {
    final favItemsList = await productStorage.getProductItems("FavItems");
    favItems.assignAll(favItemsList);
    print("------------Get-Fav------------");
  }

  void deleteFavItem(FoodRepo foodRepo) async {
    final allProducts = await getAllProducts();
    final index = allProducts
        .indexWhere((element) => element.subtitle == foodRepo.subtitle);

    if (index != -1) {
      allProducts.removeAt(index);
      await productStorage.putFoodDetails(allProducts, "FavItems");
      getProductFavItem();
    }
    print('Delete Success');
  }

  void showSnackBar(String message) {
    Get.snackbar(
      "Notification",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.grey,
      colorText: Colors.white,
    );
  }

  void calculateTotal() async {
    final allProducts = await productStorage.getProductItems("CartItem");
    totalOrderQty.value = allProducts.length;
  }

  void saveToCart(FoodRepo foodRepo) async {
    print(foodRepo.qty.toString());
    final isSave = await productStorage.putFoodDetail(foodRepo, "CartItem");
    if (isSave) {
      calculateTotal();
    }
    update();
    print("_____________Put Success________________");
  }

  void getProductCart() async {
    final imageDetails = await productStorage.getProductItems("CartItem");
    productDetails.value = imageDetails;
    update();
    print("------------Get-Cart------------");
  }

}
