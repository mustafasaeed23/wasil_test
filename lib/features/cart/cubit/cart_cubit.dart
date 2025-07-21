import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store_app/features/cart/cubit/cart_state.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final Map<ProductEntity, int> _cartMap = {};

  void addToCart({required ProductEntity product}) {
    if (_cartMap.containsKey(product)) {
      _cartMap[product] = _cartMap[product]! + 1;
    } else {
      _cartMap[product] = 1;
    }
    _emitUpdatedState();
  }

  void removeFromCart({required ProductEntity product}) {
    _cartMap.remove(product);
    _emitUpdatedState();
  }

  void updateQuantity(ProductEntity product, int quantity) {
    if (quantity <= 0) {
      _cartMap.remove(product);
    } else {
      _cartMap[product] = quantity;
    }
    _emitUpdatedState();
  }

  int getQuantity(ProductEntity product) {
    return _cartMap[product] ?? 0;
  }

  List<ProductEntity> get cartItems => _cartMap.keys.toList();

  Map<ProductEntity, int> get cartMap => _cartMap;

  void _emitUpdatedState() {
    emit(CartUpdated(cartItems: _cartMap.keys.toList()));
  }
}
