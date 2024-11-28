import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:individual_project/controller/seeMorecontroller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:individual_project/screen/widget/Home_Screen/detail_screen.dart';

// ignore: must_be_immutable
class SeeMoreScreen extends StatelessWidget {
  SeeMoreScreen({super.key});

  SeemoreController _dataController = Get.put(SeemoreController());

  @override
  Widget build(BuildContext context) {
    // Initial search value
    String initialSearchValue = "";

    // Call the search method with the initial value
    _dataController.SearchResults(initialSearchValue);

    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
            Future.delayed(Duration(milliseconds: 250), () {
              Get.back();
            });
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: Container(
          width: 250,
          height: 50,
          child: TextFormField(
            onChanged: (value) => _dataController.SearchResults(value),
            initialValue: initialSearchValue, // Set initial value
            autofocus: true,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 19,
            ),
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _buildBody(),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Obx(
      () => ListView(
        children: [
          _dataController.serachResult.isEmpty
              ? _buildNotResult()
              : _buildAllDataSeeMore(),
          // _buildNotResult()
        ],
      ),
    );
  }

  Row _buildNotResult() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 200),
              Icon(Icons.search_sharp),
              Text(
                "Item not Found",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 8),
              Text("Try searching the item with"),
              Text(" different keyword"),
            ],
          ),
        ),
      ],
    );
  }

  Obx _buildAllDataSeeMore() {
    return Obx(
      () => StaggeredGridView.countBuilder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        itemCount: _dataController.serachResult.length,
        staggeredTileBuilder: (index) {
          return StaggeredTile.count(1, 1.6);
        },
        itemBuilder: (context, index) {
          final _getProduct = _dataController.serachResult[index];
          // double containerWidth = Get.width / 2 - 20; // Adjust as needed
          // double containerHeight = Get.height * 0.35; // Adjust as needed

          return InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
              Future.delayed(Duration(milliseconds: 250), () {
                Get.to(DetailScreen(
                  food: _getProduct,
                ));
              });
            },
            child: Container(
              margin: EdgeInsets.only(
                top: index % 2 == 0 ? 0 : 40,
                bottom: index % 2 == 0 ? 40 : 0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Container(
                        child: Image.asset(
                          _getProduct.image.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      "${_getProduct.subtitle}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                    Text(
                      "Chicken Popcorn",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: Get.width * 0.03,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Text(
                          '5',
                          style: TextStyle(
                              fontSize: Get.width * 0.035, color: Colors.amber),
                        )
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\$ ',
                            style: TextStyle(
                                fontSize: Get.width * 0.05, color: Colors.red),
                          ),
                          TextSpan(
                            text: "${_getProduct.price}",
                            style: TextStyle(
                                fontSize: Get.width * 0.07,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
