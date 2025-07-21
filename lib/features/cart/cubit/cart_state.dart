import 'package:store_app/features/home/domain/entities/product_entity.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final List<ProductEntity> cartItems;
  CartUpdated({required this.cartItems});
}

