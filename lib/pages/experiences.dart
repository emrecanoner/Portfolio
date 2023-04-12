import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:portfolio/api/methods.dart';

class Experiences extends StatefulWidget {
  const Experiences({super.key});

  @override
  State<Experiences> createState() => _ExperiencesState();
}

class _ExperiencesState extends State<Experiences> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: FutureBuilder(
        future: allExperiences(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var experienceList = snapshot.data;
            return ListView.builder(
              itemCount: experienceList?.length,
              itemBuilder: (context, index) {
                var experience = experienceList?[index];
                return GestureDetector(
                  child: SizedBox(
                    height: 300,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(experience!.title!),
                          Text(experience.employment_type!),
                          Text(experience.company_name!),
                          Text(experience.location!),
                          Text(experience.location_type!),
                          Text(experience.starting_date!),
                          Text(experience.ending_date!),
                          Text(experience.description!),
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
