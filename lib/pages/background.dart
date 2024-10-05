import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF004B5F), // Green at the top
                Color.fromARGB(255, 228, 225, 225), // White at the bottom
              ],
              stops: [0.5, 0.5], // Equal split between green and white
            ),
          ),
        ),
        Positioned.fill(
          child: child, // Scrollable content on top of static background
        ),
      ],
    );
  }
}
