import 'product_container.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({
    Key? key,
    required this.index,
    required this.categories,
    required this.products,
  }) : super(key: key);

  final int index;
  final List<String> categories;
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: index != 0
          ? products
              .where((product) => product.category == categories[index])
              .toList()
              .map(
              (product) {
                return ProductContainer(
                  product: product,
                );
              },
            ).toList()
          : products.map(
              (product) {
                return ProductContainer(product: product);
              },
            ).toList(),
    );
  }
}
