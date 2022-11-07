import 'package:e_commerce_app/features/checkout/checkout_screen.dart';
import 'package:flutter/material.dart';

import '../../shared/template/default_app_bar.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Checkout',
      ),
      body: const CheckoutScreen(),
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
