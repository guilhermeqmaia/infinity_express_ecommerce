import 'package:flutter/material.dart';

import '../../products/model/product_model.dart';

class DetailsAppBar extends StatelessWidget with PreferredSizeWidget {
  const DetailsAppBar({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text(
        product.title,
        style: const TextStyle(
          color: Colors.brown,
          fontSize: 25,
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.brown,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cart'),
            icon: const Icon(
              Icons.local_mall,
              color: Colors.brown,
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
