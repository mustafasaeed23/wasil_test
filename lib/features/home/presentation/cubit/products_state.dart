import 'package:store_app/features/home/domain/entities/product_entity.dart';

abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<ProductEntity> productsList;
  ProductsLoaded({required this.productsList});
}

class ProductsError extends ProductsState {
  final String message;
  ProductsError({required this.message});
}

class ProductsLoading extends ProductsState {}
