import 'package:flutter/material.dart';
import 'package:shopliax/service_locator.dart';
import 'package:shopliax/views/screens/splash_screen.dart';

GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(const MyApp());
  initializeSingletons();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'ShopLiax TODO',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          primary: Colors.blue.shade400,
        
          seedColor: Colors.blue.shade400),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
