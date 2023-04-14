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
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.pinkAccent,
        title: Text(
          "Educations",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: FutureBuilder(
        future: allEducations(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var educationList = snapshot.data;
            return GridView.builder(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 50, right: 50),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 4,
                childAspectRatio: 1.5,
              ),
              itemCount: educationList?.length,
              itemBuilder: (context, index) {
                var education = educationList?[index];
                return GestureDetector(
                  child: SizedBox(
                    height: 200,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Image.asset(
                            "assets/img/${education!.school_name}.png",
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(height: 10),
                          Text(
                            education.school_name!,
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          Text(education.studying_field!,
                              style: TextStyle(
                                fontSize: 7,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                              )),
                          Text(education.starting_date!,
                              style: TextStyle(
                                fontSize: 7,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                              )),
                          Text(education.ending_date!,
                              style: TextStyle(
                                fontSize: 7,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                              )),
                          Text(education.grade!,
                              style: TextStyle(
                                fontSize: 7,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                              )),
/*                           Text(education.description!,
                              style: TextStyle(
                                fontSize: 7,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                              )),
                          Text(education.projects!,
                              style: TextStyle(
                                fontSize: 7,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              )), */
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
