// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';

class LoadingSix extends StatefulWidget {
  const LoadingSix({super.key});

  @override
  _LoadingSixState createState() => _LoadingSixState();
}

class _LoadingSixState extends State<LoadingSix> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _fadeIn();
    _loadData();
  }

  void _fadeIn() {
    Future.delayed(Duration.zero, () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  Future<void> _loadData() async {
    // Simulate a delay to mimic loading
    await Future.delayed(const Duration(seconds: 3));
    // Navigate to LoadingThree after the delay
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(seconds: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/Assets/Logo.png',
                width: 110, // Set desired width
                height: 110, // Set desired height
              ),
            ],
          ),
        ),
      ),
    );
  }
}
