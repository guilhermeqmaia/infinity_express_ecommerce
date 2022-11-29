import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/cart_model.dart';

class PreSaleContainer extends StatelessWidget {
  const PreSaleContainer({
    Key? key,
    required this.preSale,
    required this.onIncrease,
    required this.onSubtract,
    required this.onRemove,
  }) : super(key: key);
  final CartModel preSale;

  final void Function() onIncrease;
  final void Function() onSubtract;
  final void Function() onRemove;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.brown,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  preSale.product.title,
                  style: const TextStyle(
                    color: Colors.brown,
                    fontFamily: 'Nunito',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                NumberFormat.simpleCurrency(locale: 'pt_BR').format(
                    (DecimalIntl(preSale.product.price) -
                            (DecimalIntl(preSale.product.price) /
                                100 *
                                preSale.product.discountPercentage)) *
                        preSale.quantity),
                style: const TextStyle(
                  color: Colors.brown,
                  fontFamily: 'Nunito',
                  fontSize: 22,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  '${preSale.quantity}',
                  style: const TextStyle(
                    color: Colors.brown,
                    fontFamily: 'Nunito',
                    fontSize: 25,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onSubtract,
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
                  onTap: onIncrease,
                  child: const Icon(
                    Icons.add,
                    color: Colors.brown,
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: onRemove,
                icon: const Icon(
                  Icons.delete,
                  color: Colors.brown,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
