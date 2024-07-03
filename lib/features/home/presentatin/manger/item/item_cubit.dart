import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import 'package:task/core/utils/constant.dart';
import 'package:task/features/home/data/models/item_model.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  late List<MenuItemModel> items = fethAllItems();
  ItemCubit() : super(ItemInitial());

  fethAllItems() {
    try {
      var box = Hive.box<MenuItemModel>(kStockBox);

      emit(ItemSuccess());
      return box.values.toList();
    } on Exception catch (e) {
      emit(ItemFailure(errorMessag: e.toString()));
    }
  }
}
