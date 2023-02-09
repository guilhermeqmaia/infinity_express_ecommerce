import 'package:e_commerce_app/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SetupTester extends StatelessWidget {
  const SetupTester({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.getRoutes,
        home: Material(
          child: MediaQuery(
            data: const MediaQueryData(),
            child: child,
          ),
        ),
      ),
    );
  }
}
