import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:individual_project/screen/widget/Home_Screen/Search/seemore.dart';
// import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

// ignore: must_be_immutable
class SearchField extends StatelessWidget {
  SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Get.to(() => SeeMoreScreen());
              },
              child: Container(
                height: Get.height / 20,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [Icon(Icons.search), Text("Search")],
                  ),
                ),
              ),
            ),
          ),
          InkWell(
              onTap: () {
                Get.to(() => SeeMoreScreen());
              },
              child: Container(
                  child: Center(
                child: Image.asset(
                  'lib/assets/images/page_info.png',
                ),
              )))
        ],
      ),
    );
  }
}
