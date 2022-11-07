import '../endpoint/products_endpoint.dart';
import '../model/get_all_products_response.dart';

abstract class IProductsRepository {
  Future<GetAllProductsResponse> getAllProducts();
}

class ProductsRepositoryImpl implements IProductsRepository {
  final IProductsEndpoint _endpoint;

  ProductsRepositoryImpl(this._endpoint);
  @override
  Future<GetAllProductsResponse> getAllProducts() async {
    final response = await _endpoint.getAllProducts();

    return GetAllProductsResponse.fromJson(response.data);
  }
}
