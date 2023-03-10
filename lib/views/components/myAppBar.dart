import 'package:flutter/material.dart';

import '../../routes.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      foregroundColor: Colors.black,
      title: const Text("MyAsbeza"),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.history);
            },
            icon: const Icon(Icons.shopping_bag)),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.profile);
            },
            icon: const Icon(Icons.account_circle_rounded)),
      ],
    );
  }
}
