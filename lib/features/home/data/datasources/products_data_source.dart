import 'package:store_app/core/Api/base_repo.dart';
import 'package:store_app/core/Api/end_points.dart';
import 'package:store_app/features/home/data/models/product_model.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';

class ProductsDataSource extends BaseRepository {
  Future<List<ProductEntity>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      final response = await appDio.get(endPoint: EndPoints.getProducts);

      final data = response.data['products'] as List;

      return data.map((item) => ProductModel.fromJson(item)).toList();
    } else {
      throw Exception("No Internet Connection");
    }
  }
}
