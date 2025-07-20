import 'package:dartz/dartz.dart';
import 'package:store_app/core/Errors/failures.dart';
import 'package:store_app/features/home/data/datasources/products_data_source.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';
import 'package:store_app/features/home/domain/repositories/products_contract_repo.dart';

class ProductsImplRepo implements ProductsContractRepo {
  final ProductsDataSource dataSource;

  ProductsImplRepo({required this.dataSource});
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final response = await dataSource.getAllProducts();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
