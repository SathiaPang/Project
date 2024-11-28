import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'track_order.dart';

class creditCard extends StatelessWidget {
  creditCard({super.key});

  // final ProfileScreenController _controller =
  //     Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Card'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildCreditCard(
                  color: Colors.red,
                  cardExpiration: "08/2022",
                  cardHolder: "HOUSSEM SELMI",
                  cardNumber: "3546 7532 XXXX 9742"),
              _buildCreditCard(
                  color: Colors.brown.shade400,
                  cardExpiration: "08/2022",
                  cardHolder: "HOUSSEM SELMI",
                  cardNumber: "3546 7532 XXXX 9742"),
              _buildAddCardButton(
                // icon: Icon(Icons.add),
                color: Colors.red,
              ),
              SizedBox(
                height: 50,
              ),
              _buildDoneButton(color: Colors.red,text: Text('Done'))
            ],
          ),
        ),
      ),
    );
  }

  Card _buildCreditCard(
      {required Color color,
      required String cardNumber,
      required String cardHolder,
      required String cardExpiration}) {
    return Card(
      elevation: 4.0,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        height: 200,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildLogosBlock(),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                '$cardNumber',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontFamily: 'CourrierPrime'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildDetailsBlock(
                  label: 'CARDHOLDER',
                  value: cardHolder,
                ),
                _buildDetailsBlock(label: 'VALID THRU', value: cardExpiration),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _buildLogosBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset(
          "lib/assets/images/sim.png",
          height: 50,
          width: 58,
        ),
        Image.asset(
          "lib/assets/images/mastercard.png",
          height: 50,
          width: 50,
        ),
      ],
    );
  }

  Column _buildDetailsBlock({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$label',
          style: TextStyle(
              color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),
        ),
        Text(
          '$value',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Container _buildAddCardButton({
    required Color color,
  }) {
    return Container(
      margin: EdgeInsets.all(Get.width * 0.05), // Adjusted margin value
      width: Get.width * 0.5,
      height: Get.height / 15,
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: Colors.red),
        borderRadius: BorderRadius.all(
          Radius.circular(
            10.0,
          ),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          Icons.add, // Replace 'add' with the desired icon name
          color: Colors.red, // Specify the desired icon color
        ),
        Text(
          'Add New Address',
          style: TextStyle(color: color, fontSize: Get.width * 0.04),
        ),
      ]),
    );
  }

  GestureDetector _buildDoneButton({
    required Color color,
    required Text text,
  }) {
    return GestureDetector(
      onTap: () {
        // Uncomment the following line if you want to navigate to a new screen.
        Get.to(TrackOrder());
      },
      child: SizedBox(
        width: Get.width * 0.8, // Responsive width
        height: Get.height * 0.06, // Responsive height
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(
                Get.width * 0.03), // Responsive border radius
          ),
          child: Center(
            child: Text(
              text.data ?? "", // Extracting text data from the Text widget
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.width * 0.04, // Responsive font size
              ),
            ),
          ),
        ),
      ),
    );
  }
}
