import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_asbeza/routes.dart';
import 'package:my_asbeza/views/history.dart';
import 'package:my_asbeza/views/home.dart';
import 'package:my_asbeza/views/profile.dart';

import 'bloc/asbeza_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AsbezaBloc(),
      child: MaterialApp(
        initialRoute: Routes.home,
        routes: {
          Routes.home: (context) => const HomePage(),
          Routes.profile: (context) => const ProfilePage(),
          Routes.history: (context) => const HistoryPage(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
