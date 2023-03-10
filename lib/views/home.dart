import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_asbeza/views/components/myAppBar.dart';
import 'package:my_asbeza/views/components/myDrawer.dart';

import '../bloc/asbeza_bloc.dart';
import '../routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: MyAppBar(),
      ),
      drawer: MyDrawer(),
      body: BlocBuilder<AsbezaBloc, AsbezaState>(
        builder: (context, state) {
          if (state is AsbezaInitial) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AsbezaBloc>(context).add(const AsbezaEvent());
                },
                child: const Text("GET YOU ASBEZA"),
              ),
            );
          }
          if (state is AsbezaLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AsbezaSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * .1,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        color: Colors.amberAccent,
                        height: MediaQuery.of(context).size.height * .05,
                        width: MediaQuery.of(context).size.width * .35,
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.only(right: 15.0),
                        child: Text(state.asbeza[0].foodTitle),
                      );
                    },
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  child: const Text(
                    "ASBEZA ITEMS",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  height: MediaQuery.of(context).size.height * .72,
                  child: ListView.builder(
                    itemCount: state.asbeza.length,
                    itemBuilder: (BuildContext context, int index) {
                      final asbezaVal = state.asbeza[index];
                      return Container(
                        height: MediaQuery.of(context).size.height * .15,
                        color: Colors.blueAccent,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 11, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(asbezaVal.foodTitle),
                            Text(asbezaVal.foodPrice.toString()),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
