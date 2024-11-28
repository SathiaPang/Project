import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:individual_project/controller/auth_controller.dart';
import 'package:individual_project/screen/widget/Menu_List/Profile/Edit_Profile/edit_profile_screen.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key});

  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _authController.user.value.username ?? "",
            style: TextStyle(
              fontSize: Get.width * 0.06,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            _authController.user.value.email ?? "",
            style: TextStyle(
                fontSize: Get.width * 0.04, color: Colors.grey.shade700),
          ),
          Text(
            _authController.user.value.phoneNumber ?? "",
            style: TextStyle(
                fontSize: Get.width * 0.04, color: Colors.grey.shade700),
          ),
          SizedBox(height: Get.height * 0.01),
          InkWell(
            onTap: () {
              Get.to(EditProfileScreen());
            },
            child: Container(
              height: Get.height * 0.07,
              width: Get.width * 0.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Get.width * 0.1),
                  color: Colors.red),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Edit Profile',
                      style: TextStyle(
                          fontSize: Get.width *
                              0.035, // Adjust the font size as needed
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
