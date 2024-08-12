import 'package:flutter/material.dart';
import 'package:shopliax/views/components/navigation.dart';
import 'package:shopliax/views/screens/selection_screen.dart';
import 'package:shopliax/views/screens/todo_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _animation = CurvedAnimation(
        parent: _animationController!, curve: Curves.easeInExpo);
    _animationController!.forward();
    Future.delayed(const Duration(seconds: 5),
        () async => {await navigateReplaceToPage(SelectionScreen())});
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: double.infinity,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(38.0),
        child: Center(
          child: FadeTransition(
              opacity: _animation!,
              child: Image.asset("assets/images/pngs/logo.png")),
        ),
      ),
    );
  }
}
