part of 'quantityselector_cubit.dart';

@immutable
abstract class QuantitySelectorState {}

class QuantitySelected extends QuantitySelectorState {
  final int selectedQuantity;

  QuantitySelected({required this.selectedQuantity});
}

class QuantityNotSelected extends QuantitySelectorState {}
