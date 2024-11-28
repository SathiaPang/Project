import 'package:get/get.dart';
import 'package:individual_project/model/history.dart';

import '../repositary/repo_controller.dart';

class AddToHistoryController extends GetxController {
  final ProductStorage _historyStorage = ProductStorage.instance;

  final foodlisthistory = <History>[].obs;

  void getAllHistory() async {
    final foodGetHistory = await _historyStorage.getHistory();
    foodlisthistory(foodGetHistory);
  }
}
