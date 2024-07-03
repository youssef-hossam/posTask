import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/colors.dart';

import 'package:task/core/utils/styles.dart';
import 'package:task/features/home/data/models/item_model.dart';
import 'package:task/features/home/presentatin/widgets/quantity_selector.dart';

class StockItem extends StatelessWidget {
  const StockItem({
    super.key,
    required this.menuItem,
  });

  final MenuItemModel menuItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: menuItem.isSelected ? Colors.black : Colors.transparent,
          )),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            height: 90.h,
            width: 90.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    menuItem.image,
                  )),
              color: AppColors.primaryColor,
              // borderRadius: BorderRadius.circular(10)),
            )),
        SizedBox(
          height: 10.h,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              menuItem.name,
              style: Styles.regularname,
            ),
            Text(
              "${menuItem.price} \$",
            ),
            QuantitySelector(menuItem: menuItem),
          ],
        )
      ]),
    );
  }
}
