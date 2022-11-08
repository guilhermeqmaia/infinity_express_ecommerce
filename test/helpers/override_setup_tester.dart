import 'package:e_commerce_app/app_routes.dart';
import 'package:e_commerce_app/features/products/model/product_model.dart';
import 'package:e_commerce_app/features/products/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'fake_repository.dart';

class OverrideSetupTester extends StatelessWidget {
  const OverrideSetupTester({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final overrideProductsProvider = FutureProvider<List<ProductModel>>((ref) {
      return FakeRepository.fetchProducts();
    });
    return ProviderScope(
      overrides: [
        productsProvider.overrideWithProvider(overrideProductsProvider),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.getRoutes,
        home: Material(
          child: MediaQuery(
            data: const MediaQueryData(),
            child: child,
          ),
        ),
      ),
    );
  }
}
