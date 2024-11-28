import 'package:individual_project/data/data.dart';

class HomeRepository {
  
  List<FoodRepo> getFoodList() {
    return FoodRepo.foodrepo;
  }
}
