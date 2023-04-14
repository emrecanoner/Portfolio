import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:portfolio/components/pages.dart';
import 'package:portfolio/pages/courses.dart';
import 'package:portfolio/pages/educations.dart';
import 'package:portfolio/pages/experiences.dart';
import 'package:portfolio/pages/home.dart';
import 'package:portfolio/pages/licences&certifications.dart';
import 'package:portfolio/pages/skills.dart';
import 'package:portfolio/pages/volunteering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      home: Home(),
      routes: {
        'educations': (context) => Educations(),
        'experiences': (context) => Experiences(),
        'volunteering': (context) => Volunteering(),
        'licences&certifications': (context) => LicencesCertifications(),
        'skills': (context) => Skills(),
        'courses': (context) => Courses(),
      },
    );
  }
}
