// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:individual_project/screen/widget/Home_Screen/Order/order_screen.dart';

// class OrderBox extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: Get.height * 0.2, // Responsive height
//       margin: EdgeInsets.all(Get.width * 0.03), // Responsive margin
//       decoration: BoxDecoration(
//         borderRadius:
//             BorderRadius.circular(Get.width * 0.06), // Responsive border radius
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.shade400,
//             spreadRadius: Get.width * 0.01,
//             blurRadius: Get.width * 0.01,
//             offset: Offset(0, Get.width * 0.005),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: EdgeInsets.symmetric(
//             vertical: Get.height / 40,
//             horizontal: Get.width * 0.08), // Responsive padding
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Delivery Time ',
//                   style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500), // Responsive font size
//                 ),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.access_time,
//                       color: Colors.red,
//                     ),
//                     SizedBox(width: Get.width / 80),
//                     Text(
//                       '25 mins',
//                       style: TextStyle(
//                         // fontSize: , // Responsive font size
//                         color: Colors.black,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//             SizedBox(
//               height: Get.height * 0.02, // Responsive height
//             ),
//             Text("Total Price",
//                 style: TextStyle(
//                     fontWeight: FontWeight.w500)), // Responsive font size
//             SizedBox(
//               height: Get.height * 0.01, // Responsive height
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 RichText(
//                   text: TextSpan(
//                     children: [
//                       TextSpan(
//                         text: '\$ ',
//                         style: TextStyle(
//                             // fontSize: Get.width * 0.04,
//                             color: Colors.red), // Responsive font size
//                       ),
//                       TextSpan(
//                         text: '20.00',
//                         style: TextStyle(
//                             fontSize: 26,
//                             color: Colors.black), // Responsive font size
//                       ),
//                     ],
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     // Use Get.to() for navigation
//                     Get.to(() =>
//                         Order_Screen()); // Replace YourNextScreen with the screen you want to navigate to
//                   },
//                   child: SizedBox(
//                     child: Container(
//                       width: Get.width * 0.4, // Responsive width
//                       height: Get.height * 0.06, // Responsive height
//                       decoration: BoxDecoration(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.circular(
//                             Get.width * 0.03), // Responsive border radius
//                       ),
//                       child: Center(
//                         child: Text(
//                           'Place Order',
//                           style: TextStyle(
//                             color: Colors.white,
//                             // Responsive font size
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
