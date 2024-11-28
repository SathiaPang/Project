import 'package:flutter/material.dart';
import 'package:get/get.dart';

class History_detail extends StatelessWidget {
  const History_detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
    );
  }
}
