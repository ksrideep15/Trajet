import 'package:flutter/material.dart';

class WhyChoseUs extends StatelessWidget {
  const WhyChoseUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20), // Add padding for better layout
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 200,
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Why Chose Us?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'We provide exceptional services with a focus on customer satisfaction. Our platform ensures a seamless and convenient booking experience, with competitive pricing and a wide range of options.',
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey, // Placeholder color
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/defaultprofile.png'), // Placeholder path for the logo
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
