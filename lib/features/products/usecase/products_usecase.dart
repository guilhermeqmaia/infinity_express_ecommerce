import '../mapper/products_mapper.dart';
import '../model/product_model.dart';
import '../../../shared/api/repository/products_repository.dart';

abstract class IProductsUsecase {
  Future<List<ProductModel>> getAllProducts();
}

class ProductsUsecaseImpl implements IProductsUsecase {
  final IProductsRepository _repository;

  ProductsUsecaseImpl(this._repository);
  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await _repository.getAllProducts();
    return response.toViewData();
  }
}
