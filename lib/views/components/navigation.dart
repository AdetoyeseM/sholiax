import 'package:flutter/cupertino.dart'; 
import 'package:shopliax/main.dart';

navigateToPage(Widget page) {
  Navigator.push(navigatorKey!.currentContext!,
      CupertinoPageRoute(builder: (context) => page));
}

popView(BuildContext? context) {
  Navigator.pop(context!);
}

navigateReplaceToPage(Widget page) {
  Navigator.pushReplacement(
    navigatorKey!.currentContext!,
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;

        var tween = Tween(begin: begin, end: end);
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    ),
  );
}
