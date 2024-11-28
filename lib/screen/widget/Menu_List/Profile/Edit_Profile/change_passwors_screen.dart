import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
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
            horizontal: Get.width * 0.05,
            vertical: Get.height * 0.05,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            Colors.deepPurpleAccent.withOpacity(0.1),
                        radius: Get.width * 0.3,
                        child: Center(
                          child: Icon(
                            Icons
                                .lock_reset_rounded, // Replacfe with the desired icon
                            size: Get.width *
                                0.2, // Adjust the icon size as needed
                            color: Colors
                                .amber, // Customize the icon color as needed
                          ),
                        ), // Adjust the radius as needed
                      ),
                    ],
                  ),
                  Positioned(
                    top: Get.height * 0.23,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: Get.width,
                      height: Get.height * 0.6, // Adjust the height as needed
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(top: BorderSide(color: Colors.black)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
                cursorHeight: 20,
              ),
              SizedBox(height: Get.height * 0.02),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
                cursorHeight: 20,
              ),
              SizedBox(height: Get.height * 0.02),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
                cursorHeight: 20,
              ),
              InkWell(
                onTap: () {},
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
                        'Change',
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
