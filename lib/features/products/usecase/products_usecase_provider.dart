import 'products_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/api/repository/products_repository_provider.dart';

final productsUsecaseProvider = Provider(
  (ref) => ProductsUsecaseImpl(
    ref.watch(productsRepositoryProvider),
  ),
);
