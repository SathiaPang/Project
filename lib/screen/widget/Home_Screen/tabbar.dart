// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class CustomTabBar extends StatefulWidget {
//   final List<String> categories;
//   final ValueChanged<String> onTabChanged;
//   final IconData Function(String) getIcon;

//   const CustomTabBar({
//     Key? key,
//     required this.categories,
//     required this.onTabChanged,
//     required this.getIcon,
//   }) : super(key: key);

//   @override
//   State<CustomTabBar> createState() => _CustomTabBarState();
// }

// class _CustomTabBarState extends State<CustomTabBar>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   int _activeTab = 0;

//   @override
//   void initState() {
//     super.initState();
//     _tabController =
//         TabController(length: widget.categories.length, vsync: this);

//     _tabController.addListener(() {
//       setState(() {
//         _activeTab = _tabController.index;
//         widget.onTabChanged(widget.categories[_activeTab]);
//       });
//     });
//   }

//   List<Widget> _buildTabUI() {
//     return widget.categories
//         .asMap()
//         .entries
//         .map((entry) =>
//             buildTab(entry.value, widget.getIcon(entry.value), entry.key))
//         .toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 70,
//             child: TabBar(
//               isScrollable: true,
//               dividerColor: Colors.transparent,
//               controller: _tabController,
//               indicatorColor: Colors.transparent,
//               labelColor: Colors.white,
//               tabAlignment: TabAlignment.start,
//               tabs: _buildTabUI(),
//             ),
//           ),
//           const SizedBox(height: 10),
//         ],
//       ),
//     );
//   }

//   Widget buildTab(String label, IconData icon, int index) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: _activeTab == index
//             ? Colors.red
//             : Colors.grey,
//       ),
//       height: 60,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Row(
//           children: [
//             Icon(
//               icon,
//               color: Colors.white,
//             ),
//             SizedBox(width: 20),
//             Text(
//               label,
//               style: GoogleFonts.poppins(
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
