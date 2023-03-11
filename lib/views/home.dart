import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_asbeza/views/components/myAppBar.dart';
import 'package:my_asbeza/views/components/myDrawer.dart';
import '../bloc/asbeza_bloc.dart';

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
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 50),
                    alignment: Alignment.center,
                    elevation: 0),
                onPressed: () {
                  BlocProvider.of<AsbezaBloc>(context).add(const AsbezaEvent());
                },
                icon: const Icon(Icons.shopping_basket_rounded),
                label: const Text("GET YOU ASBEZA"),
              ),
            );
          }
          if (state is AsbezaLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AsbezaSuccess) {
            return Container(
              margin: const EdgeInsets.only(top: 5),
              height: MediaQuery.of(context).size.height * .88,
              child: ListView.builder(
                itemCount: state.asbeza.length,
                itemBuilder: (BuildContext context, int index) {
                  final asbezaVal = state.asbeza[index];
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: NetworkImage(asbezaVal.image))),
                                height: MediaQuery.of(context).size.height * .1,
                                width: MediaQuery.of(context).size.width * .3,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 11, vertical: 5),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(asbezaVal.foodTitle),
                                    Text(
                                      "${asbezaVal.foodPrice}\$",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.shopping_cart))
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  );
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
