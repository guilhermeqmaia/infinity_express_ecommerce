import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../cart/model/cart_model.dart';

class ContentDisplayContainer extends StatelessWidget {
  const ContentDisplayContainer({
    Key? key,
    required this.productsInCart,
  }) : super(key: key);

  final List<CartModel> productsInCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.55,
      decoration: const BoxDecoration(
        border: Border.symmetric(
          vertical: BorderSide(
            color: Colors.brown,
            width: 2,
          ),
        ),
      ),
      child: _ProductsInCartListView(productsInCart),
    );
  }
}

class _ProductsInCartListView extends StatelessWidget {
  const _ProductsInCartListView(this.productsInCart);

  final List<CartModel> productsInCart;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productsInCart.length,
      itemBuilder: (context, index) {
        final product = productsInCart[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(product.product.thumbnail),
          ),
          title: Text(
            product.product.title,
            style: const TextStyle(fontSize: 20, fontFamily: 'SourceSans'),
          ),
          subtitle: Text(
            "Ammount: ${product.quantity}",
            style: const TextStyle(
              fontFamily: 'SourceSans',
              fontSize: 15,
            ),
          ),
          trailing: Text(
            NumberFormat.simpleCurrency(locale: 'pt_BR')
                .format(DecimalIntl(product.product.price) * product.quantity),
            style: const TextStyle(
              color: Colors.brown,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        );
      },
    );
  }
}
