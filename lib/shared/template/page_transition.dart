import 'package:flutter/material.dart';

enum PageTransitionType { regular, fade }

class PageTransition {
  Widget page;
  PageTransitionType type;
  Duration transitionDuration;
  PageTransition({
    required this.page,
    this.type = PageTransitionType.regular,
    this.transitionDuration = const Duration(milliseconds: 500),
  });
  build() {
    switch (type) {
      case PageTransitionType.regular:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
        );

      case PageTransitionType.fade:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => page,
          transitionsBuilder: (_, a, __, c) => FadeTransition(
            opacity: a,
            child: c,
          ),
          transitionDuration: transitionDuration,
        );
    }
  }
}
