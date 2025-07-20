import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store_app/features/home/domain/usecases/products_use_case.dart';
import 'package:store_app/features/home/presentation/cubit/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required this.productsUseCase}) : super(ProductsInitial());

  final ProductsUseCase productsUseCase;

  Future<void> getAllProducts() async {
    emit(ProductsLoading());
    final result = await productsUseCase.call();
    result.fold((l) {
      emit(ProductsError(message: l.message));
      print(l.message);
    }, (r) => emit(ProductsLoaded(productsList: r)));
  }
}
