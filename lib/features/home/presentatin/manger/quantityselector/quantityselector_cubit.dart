import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task/features/home/data/models/item_model.dart';

part 'quantityselector_state.dart';

class QuantitySelectorCubit extends Cubit<QuantitySelectorState> {
  QuantitySelectorCubit() : super(QuantityNotSelected());

  void decrementQuantity(MenuItemModel stockItem) {
    if (stockItem.quantity > 0) {
      stockItem.quantity--;
      emit(QuantitySelected(selectedQuantity: stockItem.quantity));
      if (stockItem.quantity == 0) {
        stockItem.isSelected = false;
        emit(QuantityNotSelected());
      }
    }
  }

  void incrementQuantity(MenuItemModel stockItem) {
    if (stockItem.quantity < stockItem.availableStock) {
      stockItem.quantity++;
      stockItem.isSelected = true;
      emit(QuantitySelected(selectedQuantity: stockItem.quantity));
    }
  }

  void toggleSelection(MenuItemModel stockItem) {
    stockItem.isSelected = !stockItem.isSelected;
    if (!stockItem.isSelected) {
      stockItem.quantity = 0;
      emit(QuantityNotSelected());
    } else {
      emit(QuantitySelected(selectedQuantity: stockItem.quantity));
    }
  }
}
