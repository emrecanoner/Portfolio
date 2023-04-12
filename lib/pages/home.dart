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
        actions: <Widget>[
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
        ],
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            weight: 50,
          ),
          color: Colors.black,
          onPressed: () {},
        ),
      ),
      body: FutureBuilder(
        future: allPages(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var pagesList = snapshot.data;
            return ListView.builder(
              itemCount: pagesList?.length,
              itemBuilder: (context, index) {
                var page = pagesList?[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(animationTypeList[index]);
                  },
                  child: SizedBox(
                    height: 200,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(page!.names!),
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
