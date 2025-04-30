import 'package:finote/pages/pages.dart';
import 'package:finote/shared/shared.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finance Note App',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login-register': (context) => const LoginRegisterPage(),
        '/main': (context) => const MainPage(),
        '/home': (context) => const HomePage(),
        '/add-transaction': (context) => const AddTransactionPage(),
      },
    );
  }
}
