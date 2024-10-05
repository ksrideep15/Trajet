import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage('assets/images/defaultprofile.png'),
      ),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );
  }
}
