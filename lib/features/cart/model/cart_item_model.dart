import 'package:equatable/equatable.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';

class CartItem extends Equatable {
  final ProductEntity product;
  final int quantity;

  const CartItem({required this.product, required this.quantity});

  @override
  List<Object?> get props => [product, quantity];
}
