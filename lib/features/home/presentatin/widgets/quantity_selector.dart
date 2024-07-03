import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/home/data/models/item_model.dart';
import 'package:task/features/home/presentatin/manger/quantityselector/quantityselector_cubit.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({
    super.key,
    required this.menuItem,
  });

  final MenuItemModel menuItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            BlocProvider.of<QuantitySelectorCubit>(context)
                .decrementQuantity(menuItem);
          },
        ),
        BlocBuilder<QuantitySelectorCubit, QuantitySelectorState>(
          builder: (context, state) {
            return Text("${menuItem.quantity}");
          },
        ),
        IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              BlocProvider.of<QuantitySelectorCubit>(context)
                  .incrementQuantity(menuItem);
            }),
      ],
    );
  }
}
