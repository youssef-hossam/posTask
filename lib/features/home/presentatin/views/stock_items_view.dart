import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:task/core/utils/styles.dart';
import 'package:task/features/home/data/models/item_model.dart';

import 'package:task/features/home/presentatin/manger/item/item_cubit.dart';
import 'package:task/features/home/presentatin/manger/quantityselector/quantityselector_cubit.dart';

import 'package:task/features/home/presentatin/widgets/stock_item.dart';
import 'package:task/features/home/presentatin/widgets/total_summary.dart';

class StockItemView extends StatefulWidget {
  const StockItemView({super.key});

  @override
  State<StockItemView> createState() => _StockItemViewState();
}

class _StockItemViewState extends State<StockItemView> {
  List<MenuItemModel>? stockItems;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ItemCubit>(context).fethAllItems();
    stockItems = BlocProvider.of<ItemCubit>(context).items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Items",
              style: Styles.mainTitle,
            ),
            SizedBox(
              height: 20.h,
            ),
            BlocBuilder<ItemCubit, ItemState>(
              builder: (context, state) {
                if (state is ItemFailure) {
                  return const Center(
                    child: Text(
                        "oops there was an error , please try agin later "),
                  );
                }
                if (state is ItemSuccess) {
                  return Expanded(
                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: stockItems!.length,
                        itemBuilder: (context, index) {
                          var menuItem = stockItems![index];
                          return GestureDetector(
                            child: StockItem(menuItem: menuItem),
                            onTap: () {
                              BlocProvider.of<QuantitySelectorCubit>(context)
                                  .toggleSelection(menuItem);
                            },
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 5,
                          // childAspectRatio: 1.2,
                          mainAxisSpacing: 10,
                        )),
                  );
                }
                return const CircularProgressIndicator();
              },
            )
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          summary(stockItems: stockItems, context: context);
        },
        child: const Icon(
          Icons.shopping_cart_checkout,
        ),
      ),
    );
  }
}
