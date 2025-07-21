import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';
import 'package:store_app/features/home/domain/usecases/products_use_case.dart';
import 'package:store_app/features/home/presentation/cubit/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required this.productsUseCase}) : super(ProductsInitial());

  final ProductsUseCase productsUseCase;
  List<ProductEntity> _originalList = [];

  Future<void> getAllProducts() async {
    emit(ProductsLoading());
    final result = await productsUseCase.call();
    result.fold(
      (l) {
        emit(ProductsError(message: l.message));
      },
      (r) {
        _originalList = r;
        emit(ProductsLoaded(productsList: r));
      },
    );
  }

  void filterByCategory(String category) {
    final filtered = _originalList.where((product) => product.category == category).toList();
    emit(ProductsLoaded(productsList: filtered));
  }

  void sortByPriceAscending() {
    final currentList = List<ProductEntity>.from(_originalList);
    currentList.sort((a, b) => a.price.compareTo(b.price));
    emit(ProductsLoaded(productsList: currentList));
  }

  void sortByPriceDescending() {
    final currentList = List<ProductEntity>.from(_originalList);
    currentList.sort((a, b) => b.price.compareTo(a.price));
    emit(ProductsLoaded(productsList: currentList));
  }

  void resetFilters() {
    emit(ProductsLoaded(productsList: _originalList));
  }
}
