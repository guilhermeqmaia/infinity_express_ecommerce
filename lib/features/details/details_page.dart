import 'package:decimal/intl.dart';
import 'package:e_commerce_app/features/details/widgets/details_app_bar.dart';
import 'package:e_commerce_app/features/details/widgets/image_carousel.dart';
import 'widgets/action_buttons_row.dart';
import 'widgets/details_row.dart';
import '../products/model/product_model.dart';
import 'package:flutter/material.dart';

import 'details_arguments.dart';
import 'package:intl/intl.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.args,
  }) : super(key: key);
  final DetailsArguments args;

  @override
  Widget build(BuildContext context) {
    ProductModel product = args.product;
    return Scaffold(
      appBar: DetailsAppBar(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageCarousel(product: product),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ActionButtonsRow(product: product),
                  DetailsRow(
                    label: 'Title',
                    value: product.title,
                  ),
                  DetailsRow(
                    label: 'Price',
                    value: NumberFormat.simpleCurrency(locale: 'en_US').format(
                      DecimalIntl(product.price),
                    ),
                    isTextLineTrough: true,
                  ),
                  DetailsRow(
                    label: '${product.discountPercentage}% OFF',
                    value: NumberFormat.simpleCurrency(locale: 'en_US').format(
                        double.parse(product.price.toString()) -
                            ((double.parse(product.price.toString()) / 100) *
                                product.discountPercentage)),
                  ),
                  DetailsRow(
                    label: 'Brand',
                    value: product.brand,
                  ),
                  const _DescriptionTitle(),
                  _DescriptionText(product: product),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DescriptionText extends StatelessWidget {
  const _DescriptionText({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Text(
      product.description,
      style: const TextStyle(
        color: Colors.brown,
        fontSize: 16,
        fontFamily: 'Montserrat',
      ),
    );
  }
}

class _DescriptionTitle extends StatelessWidget {
  const _DescriptionTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 10,
      ),
      child: Text(
        'Description',
        style: TextStyle(
          color: Colors.brown,
          fontWeight: FontWeight.bold,
          fontFamily: 'Nunito',
          fontSize: 25,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
