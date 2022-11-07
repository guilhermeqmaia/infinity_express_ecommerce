import '../../details/details_arguments.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/product_model.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed('/details', arguments: DetailsArguments(product)),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.brown, width: 1.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Transform.scale(
                scale: 1,
                child: Image.network(product.thumbnail),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 5,
                  child: Text(
                    product.title,
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                      color: Colors.brown.shade800,
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Text(
                    NumberFormat.simpleCurrency(locale: 'en_US')
                        .format(double.parse(product.price.toString())),
                    style: const TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 22,
                        fontFamily: 'Montserrat'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rating: ${product.rating.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                  ),
                ),
                Text(
                  "${product.discountPercentage}% OFF",
                  style: const TextStyle(
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nunito',
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  backgroundColor: Colors.brown.shade100,
                  labelStyle: TextStyle(
                    color: Colors.brown.shade900,
                    fontFamily: 'Nunito',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  label: const Text('Know More'),
                ),
                const Chip(
                  backgroundColor: Colors.brown,
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Nunito',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  label: Text('Add to Cart'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
