// import 'package:eshop_app/Screens/loading/loading_five.dart';
// import 'package:eshop_app/Screens/loading/loading_four.dart';
// import 'package:eshop_app/Screens/loading/loading_six.dart';
import 'package:eshop_app/Screens/loading/loading_three.dart';
import 'package:flutter/material.dart';
import 'screens/loading/loading_one.dart';
import 'screens/loading/loading_two.dart';
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
        '/loading_two': (context) => const LoadingTwo(),
        '/loading_three': (context) => const LoadingThree(),
        // '/loading_four': (context) => const LoadingFour(),
        // '/loading_five': (context) => const LoadingFive(),
        // '/loading_six': (context) => const LoadingSix(),
        '/home': (context) => const Home(),
      },
    );
  }
}
