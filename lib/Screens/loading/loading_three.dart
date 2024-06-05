// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';

class LoadingThree extends StatefulWidget {
  const LoadingThree({super.key});

  @override
  _LoadingThreeState createState() => _LoadingThreeState();
}

class _LoadingThreeState extends State<LoadingThree>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    _loadData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    // Simulate a delay to mimic loading
    await Future.delayed(const Duration(seconds: 8));
    // Navigate to LoadingThree after the delay
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
          child: Image.asset(
            'lib/Assets/Logo.png',
            width: 110, // Set desired width
            height: 110, // Set desired height
          ),
        ),
      ),
    );
  }
}
