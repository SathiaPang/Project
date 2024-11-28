import 'dart:async';
import 'package:get/get.dart';
import 'package:individual_project/screen/widget/Menu_List/navigator_Bar.dart';

class SplashController extends GetxController {
  Timer? _timer;

  void intiSplashScreen() {
    _timer = Timer(
      Duration(seconds: 3), // Delay for 3 seconds
      () => Get.offAll(() => NavigatorBar()), // Always navigate to home screen
    );
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
