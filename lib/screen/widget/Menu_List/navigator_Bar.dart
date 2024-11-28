import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:individual_project/screen/widget/Home_Screen/home_Screen.dart';
import 'package:individual_project/screen/widget/Menu_List/Notification/nofica_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:individual_project/screen/widget/Menu_List/Category/cart.dart';
import 'package:individual_project/screen/widget/Menu_List/Favorite/favorite.dart';
import 'package:individual_project/screen/widget/Menu_List/Profile/profile_screen.dart';
import '../Home_Screen/drawer_widget.dart';

class NavigatorBar extends StatelessWidget {
  NavigatorBar({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Obx(() => Scaffold(
          key: _scaffoldKey,
          drawer: Drawer_Widgets(),
          body: controller.screens[controller.selectedIndex.value],
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: controller.selectedIndex.value,
            onTap: (index) {
              controller.selectedIndex.value = index;
              controller.setShowAppbar(index);
            },
            items: controller.bottomBarItems,
          ),
          appBar: controller.isHideAppBar.value
              ? null
              : AppBar(
                  leading: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      );
                    },
                  ),
                ),
        ));
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final Rx<bool> isHideAppBar = false.obs;

  void setShowAppbar(int index) {
    isHideAppBar.value = index != 0;
  }

  final screens = [
    HomeScreen(),
    const Favorite_Screen(),
    Cart_Screen(),
    const NotificationScreen(),
    Profilea_Screen(),
  ];

  final bottomBarItems = [
    SalomonBottomBarItem(
      icon: const Icon(Icons.home),
      title: const Text("Home"),
      selectedColor: Colors.purple,
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.favorite_border),
      title: const Text("Favorite"),
      selectedColor: Colors.pink,
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.shopping_cart),
      title: const Text("Cart"),
      selectedColor: Colors.orange,
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.notifications),
      title: const Text("Notification"),
      selectedColor: Colors.teal,
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.person),
      title: const Text("Profile"),
      selectedColor: Colors.teal,
    ),
  ];
}
