import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:portfolio/api/responses.dart';
import 'package:portfolio/api/tables.dart';

List<Educations> parseEducationsResponse(String response) {
  return EducationsResponse.fromJSON(json.decode(response)).educationList;
}

Future<List<Educations>> allEducations() async {
  var url = Uri.parse("http://192.168.1.35:8080/get_educations.php");
  var response = await http.get(url);
  return parseEducationsResponse(response.body);
}

List<Pages> parsePagesResponse(String response) {
  return PagesResponse.fromJSON(json.decode(response)).pagesList;
}

Future<List<Pages>> allPages() async {
  var url = Uri.parse("http://192.168.1.35:8080/get_pages.php");
  var response = await http.get(url);
  return parsePagesResponse(response.body);
}

List<Experiences> parseExperiencesResponse(String response) {
  return ExperiencesResponse.fromJSON(json.decode(response)).experiencesList;
}

Future<List<Experiences>> allExperiences() async {
  var url = Uri.parse("http://192.168.1.35:8080/get_experiences.php");
  var response = await http.get(url);
  return parseExperiencesResponse(response.body);
}
