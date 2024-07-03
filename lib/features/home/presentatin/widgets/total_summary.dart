import 'package:flutter/material.dart';

import 'package:task/features/home/data/models/item_model.dart';

void summary({required stockItems, required BuildContext context}) {
  double total = 0;
  List<MenuItemModel> selectedItems = [];
  for (var item in stockItems!) {
    if (item.isSelected) {
      total += item.price * item.quantity;
      selectedItems.add(item);
    }
  }
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Order Summary'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var item in selectedItems)
                ListTile(
                  title: Text('${item.name} x${item.quantity}'),
                  trailing:
                      Text('\$${(item.price * item.quantity).toString()}'),
                ),
              const Divider(),
              ListTile(
                title: const Text('Total'),
                trailing: Text('\$${total.toString()}'),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}
