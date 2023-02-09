import 'package:e_commerce_app/features/cart/cart_page.dart';
import 'package:e_commerce_app/features/cart/cart_screen.dart';
import 'package:e_commerce_app/shared/template/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/setup_tester.dart';

void main() {
  Future<void> loadPage(WidgetTester tester) async {
    await tester.pumpWidget(
      const SetupTester(
        child: CartPage(),
      ),
    );
  }

  testWidgets(
    'WHEN load CartPage THEN find its widgets',
    (WidgetTester tester) async {
      await loadPage(tester);

      expect(find.byType(DefaultAppBar), findsOneWidget);
      expect(find.text('Cart'), findsOneWidget);
      expect(find.byType(CartScreen), findsOneWidget);
      expect(find.text('Items in cart'), findsOneWidget);
      expect(find.text('You have no products in your cart'), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.text('Go to payment'), findsOneWidget);
    },
  );
}
