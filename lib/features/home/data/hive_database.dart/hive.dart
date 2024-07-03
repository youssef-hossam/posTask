import 'package:hive_flutter/hive_flutter.dart';

import 'package:task/core/utils/constant.dart';
import 'package:task/features/home/data/models/item_model.dart';

class HiveMethodes {
  static Future<void> openBoxes() async {
    await Hive.openBox<MenuItemModel>(kStockBox);
  }

//adding some items to stock
  static List<MenuItemModel> menuItems = [
    MenuItemModel(
      name: "pizza",
      image: 'assets/images/2.jpg',
      price: 120,
      availableStock: 10,
    ),
    MenuItemModel(
      name: "Burger",
      image: 'assets/images/1.jpg',
      price: 90,
      availableStock: 15,
    ),
    MenuItemModel(
      name: "Chicken",
      image: 'assets/images/3.jpg',
      price: 200,
      availableStock: 5,
    ),
    // Add more items as needed
  ];
  static adding() async {
    var stock = Hive.box<MenuItemModel>(kStockBox);
    await stock.addAll(menuItems);
  }
}
