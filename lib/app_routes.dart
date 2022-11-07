import 'package:e_commerce_app/features/cart/cart_page.dart';
import 'package:e_commerce_app/features/checkout/checkout_page.dart';
import 'package:e_commerce_app/features/products/products_page.dart';
import 'package:e_commerce_app/features/home/home_page.dart';
import 'package:e_commerce_app/shared/template/page_transition.dart';
import 'features/details/details_arguments.dart';
import 'features/details/details_page.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static Route? getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return PageTransition(
          page: const HomePage(),
        ).build();
      case '/products':
        return PageTransition(
          page: const ProductsPage(),
          type: PageTransitionType.fade,
        ).build();
      case '/details':
        final args = settings.arguments as DetailsArguments;
        return PageTransition(
          page: DetailsPage(args: args),
          type: PageTransitionType.fade,
        ).build();
      case '/cart':
        return PageTransition(
          page: const CartPage(),
          type: PageTransitionType.fade,
        ).build();
      case '/checkout':
        return PageTransition(
          page: const CheckoutPage(),
          type: PageTransitionType.fade,
        ).build();
    }
    return null;
  }
}
