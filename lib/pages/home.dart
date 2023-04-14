import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:portfolio/api/methods.dart';
import 'package:page_transition/page_transition.dart';
import 'package:portfolio/components/pages.dart';
import 'package:portfolio/pages/educations.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          "Can's Portfolio",
          style: TextStyle(fontSize: 20),
        ),
        /* actions: <Widget>[
          TextButton(
            style: ButtonStyle(),
            onPressed: () {},
            child: Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
          TextButton(
            style: ButtonStyle(),
            onPressed: () {},
            child: Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ),
        ], */
        /* leading: IconButton(
          icon: Icon(
            Icons.menu,
            weight: 50,
          ),
          color: Colors.black,
          onPressed: () {},
        ), */
      ),
      body: FutureBuilder(
        future: allPages(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var pagesList = snapshot.data;
            return GridView.builder(
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: pagesList?.length,
              itemBuilder: (context, index) {
                var page = pagesList?[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(animationTypeList[index]);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: Offset(0, 3))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/img/${page!.names}.png",
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(height: 8),
                          Text(
                            page.names!,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        },
      ),
    );
  }
}
