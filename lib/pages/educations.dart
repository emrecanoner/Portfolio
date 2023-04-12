import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:portfolio/api/methods.dart';

class Educations extends StatefulWidget {
  const Educations({super.key});

  @override
  State<Educations> createState() => _EducationsState();
}

class _EducationsState extends State<Educations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true),
      body: FutureBuilder(
        future: allEducations(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var educationList = snapshot.data;
            return ListView.builder(
              itemCount: educationList?.length,
              itemBuilder: (context, index) {
                var education = educationList?[index];
                return GestureDetector(
                  child: SizedBox(
                    height: 200,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(education!.school_name!),
                          Text(education.studying_field!),
                          Text(education.starting_date!),
                          Text(education.ending_date!),
                          Text(education.grade!),
                          Text(education.description!),
                          Text(education.projects!),
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
