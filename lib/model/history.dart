import 'package:individual_project/data/data.dart';
import 'package:intl/intl.dart';

class History {
  final int qty;
  final double price;
  final List<FoodRepo> items;
  final String orderDate;

  History({
    required this.qty,
    required this.price,
    required this.items,
    required this.orderDate,
  });

  factory History.fromJson(Map<String, dynamic> json) {
    List<FoodRepo>? details;

    if (json['items'] != null) {
      details = (json['items'] as List)
          .map((e) => FoodRepo.fromMap(e as Map<String, dynamic>))
          .toList();
    }

    return History(
      orderDate: json["orderDate"] ?? "",
      qty: json['qty'] ?? 0,
      price: json['price'] ?? 0.0,
      items: details ?? [],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "orderDate": orderDate,
      "qty": qty,
      "price": price,
      "items": items.map((e) => e.toMap()).toList(),
    };
  }

  String formatDate() =>
      DateFormat("yyyy/MMM/dd hh:mm a").format(DateTime.parse(orderDate));

  String formatDate1() => DateFormat("yyyymmmdd").format(
        DateTime.parse(orderDate),
      );

  int getItemsCount() {
    var totalQty = 0;
    items.forEach((element) {
      totalQty += element.qty;
    });
    print('------->>${totalQty}');
    return totalQty;
  }
}
