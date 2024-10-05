import 'package:flutter/material.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.menu,
        size: 35,
      ),
      color: Colors.white,
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );
  }
}
