part of 'item_cubit.dart';

@immutable
abstract class ItemState {}

class ItemInitial extends ItemState {}

class ItemFailure extends ItemState {
  final String errorMessag;

  ItemFailure({required this.errorMessag});
}

class ItemSuccess extends ItemState {
  // final List<MenuItemModel> items;

  // ItemSuccess({required this.items});
}
