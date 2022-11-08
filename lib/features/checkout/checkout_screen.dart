import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:e_commerce_app/features/checkout/widgets/bottom_display_container.dart';
import 'package:e_commerce_app/features/checkout/widgets/content_display_container.dart';
import 'package:e_commerce_app/features/checkout/widgets/top_display_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../cart/cart_provider.dart';
import '../cart/model/cart_model.dart';

class CheckoutScreen extends ConsumerWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  String getTotal(List<CartModel> products) {
    DecimalIntl total = DecimalIntl(Decimal.parse('0.0'));
    for (CartModel product in products) {
      total += DecimalIntl(product.product.price) * product.quantity;
    }
    return NumberFormat.simpleCurrency(locale: 'pt_BR')
        .format(double.parse(total.toString()));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsInCart = ref.watch(cartProvider.state).state;
    return Padding(
      padding: const EdgeInsets.all(25),
      child: ListView(
        children: [
          const TopDisplayContainer(),
          ContentDisplayContainer(productsInCart: productsInCart),
          BottomDisplayContainer(total: getTotal(productsInCart)),
        ],
      ),
    );
  }
}
