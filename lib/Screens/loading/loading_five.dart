// // ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

// import 'package:flutter/material.dart';

// class LoadingFive extends StatefulWidget {
//   const LoadingFive({super.key});

//   @override
//   _LoadingFiveState createState() => _LoadingFiveState();
// }

// class _LoadingFiveState extends State<LoadingFive> {
//   double _opacity = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     _fadeIn();
//     _loadData();
//   }

//   void _fadeIn() {
//     Future.delayed(Duration.zero, () {
//       setState(() {
//         _opacity = 1.0;
//       });
//     });
//   }

//   Future<void> _loadData() async {
//     // Simulate a delay to mimic loading
//     await Future.delayed(const Duration(seconds: 3));
//     // Navigate to HomeScreen after the delay
//     Navigator.pushReplacementNamed(context, '/loading_six');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedOpacity(
//           opacity: _opacity,
//           duration: const Duration(seconds: 2),
//           child: Transform.rotate(
//             angle:
//                 270 * (3.141592653589793 / 180), // Convert degrees to radians
//             child: Image.asset(
//               'lib/Assets/Logo.png',
//               width: 110, // Set desired width
//               height: 110, // Set desired height
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
