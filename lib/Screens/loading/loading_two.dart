// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class LoadingTwo extends StatefulWidget {
  const LoadingTwo({super.key});

  @override
  _LoadingTwoState createState() => _LoadingTwoState();
}

class _LoadingTwoState extends State<LoadingTwo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.pushReplacementNamed(context, '/loading_three');
        }
      });

    _sizeAnimation = Tween<double>(begin: 220, end: 110).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.5, curve: Curves.easeInOut),
      ),
    );

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _sizeAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _sizeAnimation.value / 110,
                  child: Image.asset(
                    'lib/Assets/Logo.png',
                    width: 110,
                    height: 110,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
