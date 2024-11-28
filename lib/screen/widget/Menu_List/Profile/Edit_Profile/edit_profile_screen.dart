import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:individual_project/controller/auth_controller.dart';
import 'package:individual_project/screen/widget/Menu_List/Profile/Edit_Profile/change_passwors_screen.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key});

  final AuthController _authController = Get.find();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _usernameController.text = _authController.user.value.username ?? "";
    _emailController.text = _authController.user.value.email ?? "";
    _phoneNumberController.text = _authController.user.value.phoneNumber ?? "";

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Get.height * 0.05,
            horizontal: Get.width * 0.04,
          ),
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
                                      image: _authController
                                              .profileImagePath.isEmpty
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
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                _authController.showPicker(context);
                              },
                              child: Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  labelText: 'Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                ),
                cursorHeight: 20,
              ),
              SizedBox(height: Get.height * 0.02),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  labelText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                ),
                cursorHeight: 20,
              ),
              SizedBox(height: Get.height * 0.02),
              TextField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                ),
                cursorHeight: 20,
              ),
              SizedBox(
                height: Get.height / 40,
              ),
              InkWell(
                onTap: () {
                  Get.to(ChangePasswordScreen());
                },
                child: Padding(
                  padding: EdgeInsets.all(
                      Get.width * 0.02), // Adjust padding as needed
                  child: Container(
                    height: Get.height * 0.07, // Adjust the height as needed
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Get.width *
                          0.02), // Adjust the border radius as needed
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Change Password',
                          style: TextStyle(
                            fontSize: Get.width * 0.04,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.35,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.1,
              ),
              InkWell(
                onTap: () {
                  _authController.updateUserInfo(
                    _usernameController.text,
                    _emailController.text,
                    _phoneNumberController.text,
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(
                      Get.width * 0.02), // Adjust padding as needed
                  child: Container(
                    height: Get.height * 0.07, // Adjust the height as needed
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Get.width *
                          0.02), // Adjust the border radius as needed
                      color: Colors.red,
                    ),
                    child: Center(
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: Get.width * 0.05,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
