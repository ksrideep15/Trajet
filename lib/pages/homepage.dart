import 'package:flutter/material.dart';
import 'package:trajet/pages/background.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004B5F),
        title: const Center(
          child: Text(
            "Welcome to Trajet",
            style: TextStyle(
              fontFamily: 'Lexend',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Background(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Example placeholder for the "source-destination" section
                  Container(
                      height: 200,
                      color: Colors.white, // Temporary color, style it later
                      child: const Center(
                        child: Text("Source-Destination Container"),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
