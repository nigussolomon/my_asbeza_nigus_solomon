import 'package:flutter/material.dart';
import 'package:my_asbeza/views/components/myDrawer.dart';

import 'components/myAppBar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: MyAppBar()),
      drawer: MyDrawer(),
    );
  }
}
