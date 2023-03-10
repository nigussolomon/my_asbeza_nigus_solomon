import 'package:flutter/material.dart';

import '../../routes.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});
  final drawer_items = [
    {"title": "HOME", "route": Routes.home},
    {"title": "PROFILE", "route": Routes.profile},
    {"title": "HISTORY", "route": Routes.history},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: Container(
        margin: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: drawer_items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = drawer_items[index];
            return ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, item["route"].toString());
                },
                child: Text(item["title"].toString()));
          },
        ),
      )),
    );
  }
}
