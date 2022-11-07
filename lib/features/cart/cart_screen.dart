import 'package:e_commerce_app/features/cart/cart_provider.dart';
import 'package:e_commerce_app/features/cart/widgets/pre_sale_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartProvider.state).state;
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Items in cart',
            style: TextStyle(
              color: Colors.brown,
              fontSize: 28,
              fontFamily: 'Montserrat',
            ),
          ),
          Flexible(
            child: cartProducts.isEmpty
                ? const SizedBox(
                    child: Center(
                    child: Text(
                      'You have no products in your cart',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 25,
                        fontFamily: 'Montserrat',
                        letterSpacing: 2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ))
                : ListView(
                    children: cartProducts.map(
                      (preSale) {
                        return PreSaleContainer(
                          preSale: preSale,
                          onIncrease: () => setState(
                            () => preSale.quantity++,
                          ),
                          onSubtract: () => setState(
                            () => preSale.quantity > 0
                                ? preSale.quantity--
                                : () => setState(
                                      () => cartProducts.remove(preSale),
                                    ),
                          ),
                          onRemove: () => setState(
                            () => cartProducts.remove(preSale),
                          ),
                        );
                      },
                    ).toList(),
                  ),
          ),
        ],
      ),
    );
  }
}
