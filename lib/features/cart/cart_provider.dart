import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model/cart_model.dart';

final cartProvider = StateProvider<List<CartModel>>(
  (ref) {
    return [];
  },
);
