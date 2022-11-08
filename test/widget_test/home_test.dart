import 'package:e_commerce_app/features/home/home_page.dart';
import 'package:e_commerce_app/features/products/products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../helpers/override_setup_tester.dart';

void main() {
  Future<void> loadPage(WidgetTester tester) async {
    await tester.pumpWidget(
      const OverrideSetupTester(
        child: HomePage(),
      ),
    );
  }

  testWidgets('WHEN load HomePage THEN navigate to Products',
      (WidgetTester tester) async {
    mockNetworkImagesFor(
      () async {
        await loadPage(tester);

        await tester.tap(find.byType(MaterialButton));

        await tester.pumpAndSettle();

        expect(find.byType(ProductsPage), findsOneWidget);
      },
    );
  });
  testWidgets(
    'WHEN load HomePage THEN find its widgets',
    (WidgetTester tester) async {
      await loadPage(tester);

      expect(find.text('Infinity Express'), findsOneWidget);
      expect(find.text('Buy All You Need'), findsOneWidget);
      expect(find.text('With The Price You Want'), findsOneWidget);
      expect(find.byType(MaterialButton), findsOneWidget);
    },
  );
}
