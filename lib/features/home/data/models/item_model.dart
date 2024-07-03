// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'item_model.g.dart';

@HiveType(typeId: 0)
class MenuItemModel extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final double price;
  @HiveField(3)
  bool isSelected;
  @HiveField(4)
  int quantity;
  @HiveField(5)
  final int availableStock;
  MenuItemModel({
    required this.name,
    required this.image,
    required this.price,
    this.isSelected = false,
    this.quantity = 0,
    required this.availableStock,
  });
}
