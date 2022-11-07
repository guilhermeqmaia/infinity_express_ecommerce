import 'package:e_commerce_app/features/cart/cart_provider.dart';
import 'package:e_commerce_app/features/cart/model/cart_model.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce_app/features/products/model/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActionButtonsRow extends ConsumerStatefulWidget {
  const ActionButtonsRow({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel product;

  @override
  ConsumerState<ActionButtonsRow> createState() => _ActionButtonsRowState();
}

class _ActionButtonsRowState extends ConsumerState<ActionButtonsRow> {
  int value = 0;
  void increase() => setState(() => value++);

  void subtract() => setState(() => value > 0 ? value-- : 0);

  void setValueToZero() => setState(() => value = 0);

  @override
  Widget build(BuildContext context) {
    final cartSales = ref.read(cartProvider);
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 7,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.brown,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  '$value',
                  style: const TextStyle(
                    color: Colors.brown,
                    fontFamily: 'Nunito',
                    fontSize: 25,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => subtract(),
                child: const Icon(
                  Icons.remove,
                  color: Colors.brown,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: GestureDetector(
                  onTap: () => increase(),
                  child: const Icon(
                    Icons.add,
                    color: Colors.brown,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: value == 0
              ? null
              : () {
                  int index = cartSales.indexWhere(
                      (element) => element.product.id == widget.product.id);
                  index == -1
                      ? cartSales.add(
                          CartModel(
                            product: widget.product,
                            quantity: value,
                          ),
                        )
                      : cartSales.elementAt(index).quantity += value;
                  Navigator.pushNamed(context, '/cart');
                  setValueToZero();
                },
          child: Chip(
            padding: const EdgeInsets.all(12),
            label: const Text('Add to Cart'),
            backgroundColor: value == 0 ? Colors.brown.shade100 : Colors.brown,
            labelStyle: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontFamily: 'Nunito',
            ),
          ),
        ),
      ],
    );
  }
}
