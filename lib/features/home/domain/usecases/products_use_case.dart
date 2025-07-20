import 'package:dartz/dartz.dart';
import 'package:store_app/core/Errors/failures.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';
import 'package:store_app/features/home/domain/repositories/products_contract_repo.dart';

class ProductsUseCase {
  final ProductsContractRepo contractRepo;

  ProductsUseCase({required this.contractRepo});

  Future<Either<Failure, List<ProductEntity>>> call() async {
    return await contractRepo.getProducts();
  }
}
