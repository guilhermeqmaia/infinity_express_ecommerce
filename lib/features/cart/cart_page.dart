import 'package:e_commerce_app/features/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const _CartAppBar(),
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

class _CartAppBar extends StatelessWidget with PreferredSizeWidget {
  const _CartAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
      title: const Text('Cart'),
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
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 56);
}
