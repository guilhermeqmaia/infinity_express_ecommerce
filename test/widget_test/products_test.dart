import 'package:e_commerce_app/features/products/products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../helpers/override_setup_tester.dart';

void main() {
  Future<void> loadPage(WidgetTester tester) async {
    await tester.pumpWidget(
      const OverrideSetupTester(
        child: ProductsPage(),
      ),
    );
  }

  testWidgets('WHEN load ProductsPage THEN inspect container',
      (WidgetTester tester) async {
    mockNetworkImagesFor(
      () async {
        await loadPage(tester);

        await tester.pumpAndSettle();

        expect(find.byType(ListView), findsWidgets);
        expect(find.text('ALL'), findsOneWidget);
      },
    );
  });
}
