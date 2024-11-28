// import 'package:flutter/material.dart';

import 'dart:convert';

class FoodCategory {
  String food, images, price, rate;

  FoodCategory({
    required this.food,
    required this.images,
    required this.price,
    required this.rate,
  });

  static List<FoodCategory> getList() => [
        FoodCategory(food: "Fast Food", images: "", price: "", rate: ""),
        FoodCategory(food: "Drink", images: "", price: "", rate: ""),
        FoodCategory(food: "Snack", images: "", price: "", rate: ""),
      ];
}

class FoodRepo {
  String image, subtitle, category, detail;
  double price;
  int qty = 1; // Quantity

  // Constructor with named parameters and a default value for qty
  FoodRepo({
    required this.image,
    required this.subtitle,
    required this.price,
    required this.category,
    required this.detail,
    this.qty = 1, // Default value for qty is 1
  });

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'subtitle': subtitle,
      'price': price,
      'category': category,
      'detail': detail,
      'qty': qty, // Include qty in the map
    };
  }

  // Factory method to create FoodRepo object from a map
  factory FoodRepo.fromMap(Map<String, dynamic> map) {
    return FoodRepo(
      image: map['image'],
      subtitle: map['subtitle'],
      price: (map['price'] ?? 0.0).toDouble(),
      category: map['category'],
      detail: map['detail'],
      qty: map['qty'] ??
          1, // Initialize qty from the map, default to 1 if not present
    );
  }

  static List<FoodRepo> foodrepo = [
    //fast food
    FoodRepo(
        image: 'lib/assets/images/pizza/1.png',
        subtitle: 'Supreme ',
        price: 20.00,
        category: "Fast Food",
        detail:
            "Pizza is a dish of Italian origin consisting of a usually round, flat base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients, which is then baked at a high temperature, traditionally in a wood-fired oven."),
    FoodRepo(
        image: 'lib/assets/images/pizza/2.png',
        subtitle: "Meat Lover's",
        price: 25.00,
        category: "Fast Food",
        detail:
            "Pizza is a dish of Italian origin consisting of a usually round, flat base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients, which is then baked at a high temperature, traditionally in a wood-fired oven."),
    FoodRepo(
        image: 'lib/assets/images/pizza/3.png',
        subtitle: 'Margherita Marvel',
        price: 18.99,
        category: "Fast Food",
        detail:
            "Pizza is a dish of Italian origin consisting of a usually round, flat base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients, which is then baked at a high temperature, traditionally in a wood-fired oven."),
    FoodRepo(
        image: 'lib/assets/images/pizza/4.png',
        subtitle: 'BBQ Chicken Bliss',
        price: 15.99,
        category: "Fast Food",
        detail:
            "Pizza is a dish of Italian origin consisting of a usually round, flat base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients, which is then baked at a high temperature, traditionally in a wood-fired oven."),
    FoodRepo(
        image: 'lib/assets/images/pizza/5.png',
        subtitle: 'Hawaiian Luau Delight',
        price: 24.99,
        category: "Fast Food",
        detail:
            "Pizza is a dish of Italian origin consisting of a usually round, flat base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients, which is then baked at a high temperature, traditionally in a wood-fired oven."),
    FoodRepo(
        image: 'lib/assets/images/pizza/6.png',
        subtitle: 'Spicy Pepperoni',
        price: 9.99,
        category: "Fast Food",
        detail:
            "Pizza is a dish of Italian origin consisting of a usually round, flat base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients, which is then baked at a high temperature, traditionally in a wood-fired oven."),
    FoodRepo(
        image: 'lib/assets/images/pizza/7.png',
        subtitle: 'Mediterranean Magic',
        price: 5.99,
        category: "Fast Food",
        detail:
            "Pizza is a dish of Italian origin consisting of a usually round, flat base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients, which is then baked at a high temperature, traditionally in a wood-fired oven."),
    FoodRepo(
        image: 'lib/assets/images/pizza/8.png',
        subtitle: 'Buffalo Chicken',
        price: 10.99,
        category: "Fast Food",
        detail:
            "Pizza is a dish of Italian origin consisting of a usually round, flat base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients, which is then baked at a high temperature, traditionally in a wood-fired oven."),
    FoodRepo(
        image: 'lib/assets/images/pizza/9.png',
        subtitle: 'Pesto Perfection',
        price: 22.99,
        category: "Fast Food",
        detail:
            "Pizza is a dish of Italian origin consisting of a usually round, flat base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients, which is then baked at a high temperature, traditionally in a wood-fired oven."),
    FoodRepo(
        image: 'lib/assets/images/pizza/10.png',
        subtitle: 'Truffle Mushroom',
        price: 15.99,
        category: "Fast Food",
        detail:
            "Pizza is a dish of Italian origin consisting of a usually round, flat base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients, which is then baked at a high temperature, traditionally in a wood-fired oven."),

    //Snack
    FoodRepo(
        image: 'lib/assets/images/snacks/1.png',
        subtitle: 'Honey Mustard',
        price: 25.99,
        category: "Snack",
        detail:
            "A snack is a small portion of food generally eaten between meals.[1] In general, a snack should not exceed 200 calories.[2] Snacks come in a variety of forms including packaged snack foods and other processed foods, as well as items made from fresh ingredients at home."), //Drink
    FoodRepo(
        image: 'lib/assets/images/snacks/2.png',
        subtitle: 'Popcorn Crunch',
        price: 1.99,
        category: "Snack",
        detail:
            "A snack is a small portion of food generally eaten between meals.[1] In general, a snack should not exceed 200 calories.[2] Snacks come in a variety of forms including packaged snack foods and other processed foods, as well as items made from fresh ingredients at home."), //Drink

    FoodRepo(
        image: 'lib/assets/images/snacks/3.png',
        subtitle: 'Cheesy Garlic',
        price: 2.99,
        category: "Snack",
        detail:
            "A snack is a small portion of food generally eaten between meals.[1] In general, a snack should not exceed 200 calories.[2] Snacks come in a variety of forms including packaged snack foods and other processed foods, as well as items made from fresh ingredients at home."), //Drink

    FoodRepo(
        image: 'lib/assets/images/snacks/4.png',
        subtitle: 'Sweet Mango Slices',
        price: 7.50,
        category: "Snack",
        detail:
            "A snack is a small portion of food generally eaten between meals.[1] In general, a snack should not exceed 200 calories.[2] Snacks come in a variety of forms including packaged snack foods and other processed foods, as well as items made from fresh ingredients at home."), //Drink

    FoodRepo(
        image: 'lib/assets/images/snacks/1.png',
        subtitle: 'Roasted Hummus Cups',
        price: 6.99,
        category: "Snack",
        detail:
            "A snack is a small portion of food generally eaten between meals.[1] In general, a snack should not exceed 200 calories.[2] Snacks come in a variety of forms including packaged snack foods and other processed foods, as well as items made from fresh ingredients at home."), //Drink

    FoodRepo(
        image: 'lib/assets/images/snacks/5.png',
        subtitle: 'Cinnamon Chips',
        price: 9.99,
        category: "Snack",
        detail:
            "A snack is a small portion of food generally eaten between meals.[1] In general, a snack should not exceed 200 calories.[2] Snacks come in a variety of forms including packaged snack foods and other processed foods, as well as items made from fresh ingredients at home."), //Drink

    FoodRepo(
        image: 'lib/assets/images/snacks/6.png',
        subtitle: 'Sesame Pods',
        price: 11.22,
        category: "Snack",
        detail:
            "A snack is a small portion of food generally eaten between meals.[1] In general, a snack should not exceed 200 calories.[2] Snacks come in a variety of forms including packaged snack foods and other processed foods, as well as items made from fresh ingredients at home."), //Drink

    FoodRepo(
        image: 'lib/assets/images/snacks/7.png',
        subtitle: 'Cranberry Bites',
        price: 11.11,
        category: "Snack",
        detail:
            "A snack is a small portion of food generally eaten between meals.[1] In general, a snack should not exceed 200 calories.[2] Snacks come in a variety of forms including packaged snack foods and other processed foods, as well as items made from fresh ingredients at home."), //Drink

    FoodRepo(
        image: 'lib/assets/images/snacks/8.png',
        subtitle: 'Spicy Nuts',
        price: 22.99,
        category: "Snack",
        detail:
            "A snack is a small portion of food generally eaten between meals.[1] In general, a snack should not exceed 200 calories.[2] Snacks come in a variety of forms including packaged snack foods and other processed foods, as well as items made from fresh ingredients at home."), //Drink
    FoodRepo(
        image: 'lib/assets/images/snacks/9.png',
        subtitle: 'Caprese Skewers ',
        price: 12.99,
        category: "Snack",
        detail:
            "A snack is a small portion of food generally eaten between meals.[1] In general, a snack should not exceed 200 calories.[2] Snacks come in a variety of forms including packaged snack foods and other processed foods, as well as items made from fresh ingredients at home."), //Drink

    FoodRepo(
        image: 'lib/assets/images/snacks/10.png',
        subtitle: 'Crunchy Clusters',
        price: 12.99,
        category: "Snack",
        detail:
            "A snack is a small portion of food generally eaten between meals.[1] In general, a snack should not exceed 200 calories.[2] Snacks come in a variety of forms including packaged snack foods and other processed foods, as well as items made from fresh ingredients at home."), //Drink

    //Drink
    FoodRepo(
        image: 'lib/assets/images/drink/1.png',
        subtitle: 'Drink 1',
        price: 8.99,
        category: "Drink",
        detail:
            "A snack is a small portion of food generally eaten between meals.[1] In general, a snack should not exceed 200 calories.[2] Snacks come in a variety of forms including packaged snack foods and other processed foods, as well as items made from fresh ingredients at home."),
    FoodRepo(
        image: 'lib/assets/images/drink/12.png',
        subtitle: 'Drink 2',
        price: 12.99,
        category: "Drink",
        detail:
            "A snack is a small portion of food generally eaten between meals.[1] In general, a snack should not exceed 200 calories.[2] Snacks come in a variety of forms including packaged snack foods and other processed foods, as well as items made from fresh ingredients at home."),

    FoodRepo(
        image: 'lib/assets/images/drink/3.png',
        subtitle: 'Drink 3',
        price: 6.20,
        category: "Drink",
        detail:
            "A snack is a small portion of food generally eaten between meals.[1] In general, a snack should not exceed 200 calories.[2] Snacks come in a variety of forms including packaged snack foods and other processed foods, as well as items made from fresh ingredients at home."),

    FoodRepo(
        image: 'lib/assets/images/drink/4.png',
        subtitle: 'Drink 4',
        price: 8.00,
        category: "Drink",
        detail:
            "A snack is a small portion of food generally eaten between meals.[1] In general, a snack should not exceed 200 calories.[2] Snacks come in a variety of forms including packaged snack foods and other processed foods, as well as items made from fresh ingredients at home."),

    FoodRepo(
        image: 'lib/assets/images/drink/5.png',
        subtitle: 'Drink 5',
        price: 4.00,
        category: "Drink",
        detail:
            "A snack is a small portion of food generally eaten between meals.[1] In general, a snack should not exceed 200 calories.[2] Snacks come in a variety of forms including packaged snack foods and other processed foods, as well as items made from fresh ingredients at home."),

    FoodRepo(
        image: 'lib/assets/images/drink/6.png',
        subtitle: 'Drink 6',
        price: 2.99,
        category: "Drink",
        detail:
            "A snack is a small portion of food generally eaten between meals.[1] In general, a snack should not exceed 200 calories.[2] Snacks come in a variety of forms including packaged snack foods and other processed foods, as well as items made from fresh ingredients at home."),

    FoodRepo(
        image: 'lib/assets/images/drink/7.png',
        subtitle: 'Drink 7',
        price: 22.99,
        category: "Drink",
        detail:
            "A snack is a small portion of food generally eaten between meals.[1] In general, a snack should not exceed 200 calories.[2] Snacks come in a variety of forms including packaged snack foods and other processed foods, as well as items made from fresh ingredients at home."),

    FoodRepo(
        image: 'lib/assets/images/drink/8.png',
        subtitle: 'Drink 8',
        price: 199.99,
        category: "Drink",
        detail:
            "A snack is a small portion of food generally eaten between meals.[1] In general, a snack should not exceed 200 calories.[2] Snacks come in a variety of forms including packaged snack foods and other processed foods, as well as items made from fresh ingredients at home."),

    FoodRepo(
        image: 'lib/assets/images/drink/9.png',
        subtitle: 'Drink 9',
        price: 1.99,
        category: "Drink",
        detail:
            "A snack is a small portion of food generally eaten between meals.[1] In general, a snack should not exceed 200 calories.[2] Snacks come in a variety of forms including packaged snack foods and other processed foods, as well as items made from fresh ingredients at home."),

    FoodRepo(
        image: 'lib/assets/images/drink/10.png',
        subtitle: 'Drink 10',
        price: 12.99,
        category: "Drink",
        detail:
            "A snack is a small portion of food generally eaten between meals.[1] In general, a snack should not exceed 200 calories.[2] Snacks come in a variety of forms including packaged snack foods and other processed foods, as well as items made from fresh ingredients at home."),

    FoodRepo(
        image: 'lib/assets/images/drink/11.png',
        subtitle: 'Drink 11',
        price: 5.99,
        category: "Drink",
        detail:
            "A snack is a small portion of food generally eaten between meals.[1] In general, a snack should not exceed 200 calories.[2] Snacks come in a variety of forms including packaged snack foods and other processed foods, as well as items made from fresh ingredients at home."),

    FoodRepo(
        image: 'lib/assets/images/drink/12.png',
        subtitle: 'Drink 12',
        price: 2.99,
        category: "Drink",
        detail:
            "A snack is a small portion of food generally eaten between meals.[1] In general, a snack should not exceed 200 calories.[2] Snacks come in a variety of forms including packaged snack foods and other processed foods, as well as items made from fresh ingredients at home."),
  ];

  static fromJson(JsonDecoder jsonDecoder) {}
}
