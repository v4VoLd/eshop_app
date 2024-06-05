// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class LoadingOne extends StatefulWidget {
  const LoadingOne({super.key});

  @override
  _LoadingOneState createState() => _LoadingOneState();
}

class _LoadingOneState extends State<LoadingOne>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 8), // Total duration of all animations
      vsync: this,
    );

    _sizeAnimation = Tween<double>(begin: 220, end: 110).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.5, curve: Curves.easeInOut), // Reduce logo size after 3 seconds
      ),
    );

    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeInOut), // Fade out text over the first 3 seconds
      ),
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.8, 1.0, curve: Curves.easeInOut), // Rotate logo after previous animations are completed
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Start logo rotation after previous animations complete
        // Wait for 2 seconds and navigate to '/home'
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushReplacementNamed(context, '/home');
        });
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: _sizeAnimation.value / 110,
                  child: Transform.rotate(
                    angle: _rotationAnimation.value * 2 * 3.14,
                    child: Image.asset(
                      'lib/Assets/Logo.png',
                      width: 110,
                      height: 110,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Opacity(
                  opacity: _fadeAnimation.value,
                  child: const Text(
                    'Rcomputer',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
