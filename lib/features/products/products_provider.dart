import 'model/product_model.dart';
import 'usecase/products_usecase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productsProvider = FutureProvider<List<ProductModel>>((ref) {
  return ref.read(productsUsecaseProvider).getAllProducts();
});
