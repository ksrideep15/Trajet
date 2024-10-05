import 'package:flutter/material.dart';
import 'package:trajet/widgets/profile.dart';
import 'package:trajet/widgets/collapsedmenu.dart';

class TrajetAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TrajetAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const MenuIcon(),
      backgroundColor: const Color(0xFF004B5F),
      toolbarHeight: 120,
      title: const Center(
        child: Column(
          children: [
            Text(
              "Welcome to Trajet",
              style: TextStyle(
                letterSpacing: .75,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            Text("Let's book you a train ticket!",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                )),
          ],
        ),
      ),
      // Profile Icon
      actions: const [
        ProfileIcon(),
      ],
    );
  }

  // Implement preferredSize to satisfy the PreferredSizeWidget interface
  @override
  Size get preferredSize => const Size.fromHeight(120.0);
}
