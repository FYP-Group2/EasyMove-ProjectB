import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:easymove_merchant/services/firebase_messaging_service.dart';
import 'package:easymove_merchant/pages/login_page.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'firebase_options.dart';

@pragma('vm:entry-point')
Future<void> backgroundMessageHandler(RemoteMessage message) async {
  FirebaseMessagingService firebaseMessagingService = FirebaseMessagingService();
  await FlutterAppBadger.isAppBadgeSupported().then((value) => value?FlutterAppBadger.updateBadgeCount(1):null);
  firebaseMessagingService.show(message.data["title"], message.data["body"]);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessagingService firebaseMessagingService = FirebaseMessagingService();
  await firebaseMessagingService.initialize();
  FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
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
      home: const LoginPage(),
    );
  }
}
