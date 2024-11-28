import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:individual_project/controller/auth_controller.dart';
import 'package:individual_project/screen/widget/Menu_List/Favorite/favorite.dart';
import 'package:individual_project/screen/widget/Menu_List/Profile/button_change.dart';
import 'package:individual_project/screen/widget/Menu_List/Profile/Edit_Profile/edit_profile.dart';
import '../../Home_Screen/Order/choose-address.dart';
import '../../History/my _orderscreen.dart';
import 'Edit_Profile/coupons.dart';

class Profilea_Screen extends StatelessWidget {
  final AuthController _authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Get.height * 0.05, horizontal: Get.width * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.2,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    height: Get.height * 0.125,
                    width: double.infinity,
                    color: Colors.red,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(Get.width * 0.01),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(Get.width * 0.1),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: Get.width * 0.005,
                                blurRadius: Get.width * 0.01,
                                offset: Offset(0, Get.width * 0.015),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(Get.width * 0.1),
                            child: SizedBox.fromSize(
                                size: Size.fromRadius(Get.width * 0.15),
                                child: Obx(
                                  () => Image(
                                    image:
                                        _authController.profileImagePath.isEmpty
                                            ? AssetImage(
                                                "lib/assets/images/profile.jpg")
                                            : FileImage(File(_authController
                                                .profileImagePath
                                                .value)) as ImageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            EditProfile(),
            SizedBox(
              height: Get.height * 0.02,
            ),
            CustomButtons(
                onTap: () {
                  Get.to(MyOrder());
                },
                title: 'My Order'),
            CustomButtons(
                onTap: () {
                  Get.to(Address());
                },
                title: 'My Address'),
            CustomButtons(
                onTap: () {
                  Get.to(Favorite_Screen());
                },
                title: 'My Favorite'),
            CustomButtons(
                onTap: () {
                  Get.to(CouponsScreen());
                },
                title: 'Coupons'),
          ],
        ),
      ),
    );
  }
}
