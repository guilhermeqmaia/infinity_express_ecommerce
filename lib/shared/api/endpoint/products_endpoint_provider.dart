import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'products_endpoint.dart';

final productsEndpointProvider = Provider(
  (ref) {
    return ProductsEndpointImpl(
      Dio(
        BaseOptions(baseUrl: 'https://dummyjson.com/products'),
      ),
    );
  },
);
