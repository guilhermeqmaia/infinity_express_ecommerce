import 'package:dio/dio.dart';

abstract class IProductsEndpoint {
  Future<Response> getAllProducts();
}

class ProductsEndpointImpl implements IProductsEndpoint {
  final Dio _dio;
  ProductsEndpointImpl(this._dio);
  @override
  Future<Response> getAllProducts() {
    return _dio.get('');
  }
}
