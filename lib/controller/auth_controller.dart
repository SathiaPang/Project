import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:individual_project/authentication/login/login_screen.dart';
import 'package:individual_project/model/authe_model.dart';
import 'package:individual_project/repositary/repo_controller.dart';
import 'package:individual_project/screen/widget/Menu_List/navigator_Bar.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class AuthController extends GetxController {
  final box = GetStorage();
  final productStorage = ProductStorage.instance;
  Rx<User> user = User(username: "", email: "", password: "").obs;
  RxBool showPassword = true.obs;
  var profileImagePath = ''.obs;

  final Remail = TextEditingController(text: "Admin123@gmail.com");
  final Rpassword = TextEditingController(text: "1111");
  final Rusername = TextEditingController(text: "Admin");
  final Lemail = TextEditingController(text: "Admin123@gmail.com");
  final RphoneNumber = TextEditingController(text: "098765432");
  final Lpassword = TextEditingController(text: "1111");

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  void loadUserData() {
    final getUser = box.read('user');

    if (getUser != null) {
      final profileImage = box.read('profileImage');
      user.value = User.fromJson(getUser);
      if (profileImage != null) {
        profileImagePath.value = profileImage;
      }
    }
  }

  void register(String username, String email, String password) async {
    if (username == "" || email == "" || password == "") {
      Get.snackbar("Error", "Field null");
    } else {
      user.value = User(username: username, email: email, password: password);
      box.write(
          'user', {'username': username, 'email': email, 'password': password});
      Get.snackbar("Success", "Register success");
    }
  }

  void login(String email, String password) async {
    if (email == "" || password == "") {
      Get.snackbar("Error", "Field null");
    } else {
      final getUser = box.read('user');
      if (email == getUser?['email'] && password == getUser?['password']) {
        user.value = User(
          username: getUser?['username'],
          email: getUser?['email'],
          password: getUser?['password'],
        );
        Get.offAll(() => NavigatorBar());
        box.write('isLogin', true);
      } else {
        Get.snackbar("Error", "No Account");
      }
    }
  }

  void updateUserInfo(
      String newusername, String newemail, String newphoneNumber) async {
    user.value = User(
        email: newemail,
        phoneNumber: newphoneNumber,
        username: newusername,
        password: '');
    await box.write('user', {
      'username': newusername,
      'email': newemail,
      'phoneNumber': newphoneNumber,
    });
    Get.snackbar("Success", "User info updated");
  }

  void logout() async {
    await box.erase();
    await productStorage.clearData();
    Get.offAll(LoginScreen());
  }

  bool isLogin() {
    return box.read('isLogin') ?? false;
  }

  void showHidePass() {
    print("---------Click - Controller");
    showPassword.value = !showPassword.value;
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile == null) return;

      final savedImage = await saveFilePermanently(pickedFile.path);
      profileImagePath.value = savedImage.path;
      await box.write('profileImage', savedImage.path);

      Get.showSnackbar(GetSnackBar(
        title: 'Success',
        message: 'Profile image updated successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
      ));
    } catch (e) {
      print("${e}");
      Get.showSnackbar(GetSnackBar(
        title: 'Error',
        message: 'Failed to pick image: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ));
    }
  }

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final newPath = "${directory.path}/$name";
    return File(imagePath).copy(newPath);
  }

  void showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Photo Library'),
                onTap: () {
                  pickImage(ImageSource.gallery);
                  // Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Camera'),
                onTap: () {
                  pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
