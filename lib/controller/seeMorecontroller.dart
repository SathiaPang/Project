// import 'dart:async';
import 'package:get/get.dart';

import '../data/data.dart';

class SeemoreController extends GetxController {
  RxList<FoodRepo> serachResult = <FoodRepo>[].obs;

  void SearchResults(String Query) {
    serachResult.clear();

    FoodRepo.foodrepo.forEach((element) {
      if (element.subtitle.toLowerCase().contains(Query.toLowerCase())) {
        serachResult.add(element);
      }
      ;
    });
  }
}
