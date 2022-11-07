import '../endpoint/products_endpoint_provider.dart';
import 'products_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productsRepositoryProvider = Provider(
  (ref) {
    return ProductsRepositoryImpl(
      ref.watch(productsEndpointProvider),
    );
  },
);
