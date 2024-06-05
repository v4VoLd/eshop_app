
import 'package:flutter/material.dart';
import 'screens/loading/loading_one.dart';
import 'screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eshop_app',
      // Set LoadingOne as the initial screen
      home: const LoadingOne(),
      // Define routes for easy navigation
      routes: {
        '/loading_one': (context) => const LoadingOne(),

        '/home': (context) => const Home(),
      },
    );
  }
}
