import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:e_commerce_app/features/cart/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../cart/model/cart_model.dart';

class CheckoutPage extends ConsumerWidget {
  const CheckoutPage({Key? key}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        titleTextStyle: const TextStyle(
          color: Colors.brown,
          fontSize: 30,
          fontFamily: 'Nunito',
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.brown,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Checkout'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.home,
              color: Colors.brown,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/products');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.brown,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    'Carrinho',
                    style: TextStyle(
                        color: Colors.brown,
                        fontSize: 25,
                        fontFamily: 'Montserrat'),
                  ),
                  Icon(
                    Icons.local_mall,
                    size: 25,
                    color: Colors.brown,
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border.symmetric(
                  vertical: BorderSide(
                    color: Colors.brown,
                    width: 2,
                  ),
                ),
              ),
              child: Column(
                children: productsInCart.map((product) {
                  return ListTile(
                    title: Flexible(
                      child: Text(
                        product.product.title,
                        style: const TextStyle(
                            fontSize: 20, fontFamily: 'SourceSans'),
                      ),
                    ),
                    subtitle: Text(
                      "Ammount: ${product.quantity}",
                      style: const TextStyle(
                        fontFamily: 'SourceSans',
                        fontSize: 15,
                      ),
                    ),
                    trailing: Text(
                      NumberFormat.simpleCurrency(locale: 'pt_BR').format(
                          DecimalIntl(product.product.price) *
                              product.quantity),
                      style: const TextStyle(
                        color: Colors.brown,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.brown,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 25,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  Text(
                    getTotal(productsInCart),
                    style: const TextStyle(
                        color: Colors.brown,
                        fontSize: 22,
                        fontFamily: 'Montserrat'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown,
        onPressed: () {},
        child: const Icon(
          Icons.attach_money,
          size: 30,
        ),
      ),
    );
  }
}
