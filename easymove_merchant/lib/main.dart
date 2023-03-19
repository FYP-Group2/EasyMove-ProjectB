import 'package:flutter/material.dart';
import 'package:easymove_merchant/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final MaterialColor customMaterialColor = const MaterialColor(
    0xFFD87D40,
    <int, Color>{
      50: Color(0xFFFFF3E0),
      100: Color(0xFFFFE0B2),
      200: Color(0xFFFFCC80),
      300: Color(0xFFFFB74D),
      400: Color(0xFFFFA726),
      500: Color(0xFFD87D40),
      600: Color(0xFFFF8F00),
      700: Color(0xFFFF6F00),
      800: Color(0xFFFF5722),
      900: Color(0xFFF4511E),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyMove Merchant',
      theme: ThemeData(
        primarySwatch: customMaterialColor,
      ),
      home: const LoginPage(title: 'Login'),
    );
  }
}
