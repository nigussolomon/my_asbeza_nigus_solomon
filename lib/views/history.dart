import 'package:flutter/material.dart';
import 'package:my_asbeza/views/components/myDrawer.dart';

import 'components/myAppBar.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100), child: MyAppBar()),
      drawer: MyDrawer(),
    );
  }
}
