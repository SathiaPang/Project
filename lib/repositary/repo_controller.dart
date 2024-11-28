import 'dart:convert';
// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:individual_project/data/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/history.dart';

class ProductStorage {
  static ProductStorage get instance => ProductStorage._internal();
  ProductStorage._internal();

  Future<SharedPreferences> _getSharedPreferences() async =>
      await SharedPreferences.getInstance();

  Future<bool> putFoodDetail(FoodRepo foodRepo, String storeKey) async {
    final foodDetails = await getProductItems(storeKey);
    final isExist = foodDetails
        .indexWhere((element) => element.subtitle == foodRepo.subtitle);

    if (isExist == -1) {
      foodDetails.add(foodRepo);
      return putFoodDetails(foodDetails, storeKey);
    }

    return false;
  }

  Future<bool> putFoodDetails(
      List<FoodRepo> productDetails, String storeKey) async {
    final pref = await _getSharedPreferences();
    List<String> items =
        productDetails.map((e) => jsonEncode(e.toMap())).toList();
    return pref.setStringList(storeKey, items);
  }

  Future<List<FoodRepo>> getProductItems(String storeKey) async {
    final pref = await _getSharedPreferences();
    final items = pref.getStringList(storeKey);
    return items?.map((e) => FoodRepo.fromMap(jsonDecode(e))).toList() ?? [];
  }

  Future<bool> removeAllByKey({required String key}) async {
    final pref = await _getSharedPreferences();
    return pref.remove(key);
  }

  Future<void> setDataHistory(History foodhistory) async {
    final allFood = await getHistory();
    allFood.add(foodhistory);
    saveHistory(allFood);
  }

  Future<bool> saveHistory(List<History> foodhistory) async {
    final pref = await _getSharedPreferences();

    final List<String> tmpList =
        foodhistory.map((his) => jsonEncode(his.toMap())).toList();
    return pref.setStringList("HistoryList", tmpList);
  }

  Future<List<History>> getHistory() async {
    final pref = await _getSharedPreferences();
    List<String> rawList = pref.getStringList("HistoryList") ?? [];
    return rawList.map((e) => History.fromJson(jsonDecode(e))).toList();
  }

  // Save in history

  Future<List<History>> getAllHistoryOrder() async {
    final pref = await _getSharedPreferences();
    final items = pref.getStringList("his");
    debugPrint(items.toString());
    return items?.map((e) => History.fromJson(jsonDecode(e))).toList() ?? [];
  }

  Future<bool> putHistoryOrders(List<History> historyOrders) async {
    final pref = await _getSharedPreferences();
    List<String> items =
        historyOrders.map((e) => jsonEncode(e.toMap())).toList();
    return pref.setStringList("his", items);
  }

  Future<bool> putHistory(History order) async {
    final historyOrders = await getAllHistoryOrder();
    historyOrders.add(order);
    return putHistoryOrders(historyOrders);
  }

  Future<bool> clearData() async {
    final pref = await _getSharedPreferences();
    return pref.clear();
  }
}
