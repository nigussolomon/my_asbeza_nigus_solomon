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
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .15,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(bottom: 15),
              decoration: const BoxDecoration(
                  color: Colors.amber,
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Color.fromRGBO(0, 0, 0, 0.753), BlendMode.darken),
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://www.springboard.com/blog/wp-content/uploads/2022/08/programming-skills.png"))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10, left: 15),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            border: Border.all(width: 2, color: Colors.white),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80")),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "NIGUS SOLOMON",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "@nigus116",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
