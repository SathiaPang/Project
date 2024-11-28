import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:individual_project/data/data.dart';
import 'package:individual_project/repositary/home_repository.dart';
import 'package:individual_project/screen/widget/Home_Screen/Search/search_field.dart';
import 'package:individual_project/screen/widget/Home_Screen/Search/seemore.dart';
import 'package:individual_project/screen/widget/Home_Screen/item_view_home.dart';
import '../Menu_List/navigator_Bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final HomeController _controller = Get.put(HomeController());

  final foodCategorys = ["Fast Food", "Drink", "Snack"];

  late TabController _tabController;

  NavigationController controller = Get.put(NavigationController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: foodCategorys.length, vsync: this);

    _tabController.addListener(() {
      _controller.setTabActive(_tabController.index);
      _controller.filterByTab(foodCategorys[_tabController.index]);
    });
  }

  List<Widget> _buildTabUI() {
    List<Widget> list = [];
    for (int i = 0; i < foodCategorys.length; i++) {
      list.add(buildTab(foodCategorys[i], _getIcon(foodCategorys[i]), i));
    }
    return list;
  }

  IconData _getIcon(String category) {
    switch (category) {
      case "Fast Food":
        return Icons.fastfood;
      case "Drink":
        return Icons.local_drink;
      case "Snack":
        return Icons.local_dining;
      default:
        return Icons.category;
    }
  }

  Widget buildTab(String label, IconData icon, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: _controller.activeTab.value == index
            ? Colors.red
            : Colors.grey, // Set the background color for tabs
      ),
      height: Get.height / 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(width: 20),
            Text(
              label,
              style: GoogleFonts.poppins(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Scaffold(
          key: _scaffoldKey,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Find your',
                style: _commonTextStyle(),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Best Food ',
                      style: _boldTextStyle(),
                    ),
                    TextSpan(
                      text: 'here',
                      style: _commonTextStyle(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height / 20),
              SearchField(),
              SizedBox(height: Get.width / 30),
              Obx(
                () => TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.black,
                  tabAlignment: TabAlignment.start,
                  tabs: _buildTabUI(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Get.to(SeeMoreScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'See all',
                        style: TextStyle(
                            color: Colors.red, fontSize: Get.height / 50),
                      )
                    ],
                  ),
                ),
              ),
              Obx(
                () => Expanded(
                  child: ListView.builder(
                      itemCount: _controller.foodList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Item_View(food: _controller.foodList[index]);
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _commonTextStyle() {
    return const TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 35,
      color: Colors.black,
    );
  }

  TextStyle _boldTextStyle() {
    return const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 35,
      color: Colors.black,
    );
  }
}

class HomeController extends GetxController {
  final repo = HomeRepository();

  var selectedIndex = 0.obs;

  List<FoodRepo> allList = [];
  final foodList = <FoodRepo>[].obs;
  final activeTab = 0.obs;

  void setTabActive(int tab) {
    activeTab(tab);
  }

  @override
  void onReady() {
    allList = repo.getFoodList();
    filterByTab("Fast Food");
    super.onReady();
  }

  void filterByTab(String category) {
    final fiterList =
        allList.where((food) => food.category == category).toList();
    foodList(fiterList);
  }

  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
