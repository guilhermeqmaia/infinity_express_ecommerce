import 'package:e_commerce_app/features/cart/cart_screen.dart';
import 'package:flutter/material.dart';

import '../../shared/template/default_app_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: 'Cart'),
      body: const CartScreen(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, '/checkout'),
        backgroundColor: Colors.brown.shade400,
        label: const Text(
          'Go to payment',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
