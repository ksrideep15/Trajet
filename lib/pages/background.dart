import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(
                0xFF004B5F), // Greenish teal color (adjust according to the image)
            Colors.white, // White color for the bottom half
          ],
          stops: [0.5, 0.5], // Divides the screen into two equal parts
        ),
      ),
      child:
          child, // This will hold the content you want to place on top of the background
    );
  }
}
