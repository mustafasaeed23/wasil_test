import 'package:dartz/dartz.dart';
import 'package:store_app/core/Errors/failures.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';

abstract class ProductsContractRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}
