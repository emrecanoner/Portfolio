import 'package:portfolio/api/tables.dart';

class EducationsResponse {
  int? success;
  late List<Educations> educationList;

  EducationsResponse(
    this.success,
    this.educationList,
  );

  factory EducationsResponse.fromJSON(Map<dynamic, dynamic> json) {
    var jsonArray = (json["educations"] ?? []) as List;
    List<Educations> educationList = jsonArray
        .map((jsonArrayNesnesi) => Educations.fromJSON(jsonArrayNesnesi))
        .toList();

    return EducationsResponse(json["success"] as int?, educationList);
  }
}

class PagesResponse {
  int? success;
  late List<Pages> pagesList;

  PagesResponse(
    this.success,
    this.pagesList,
  );

  factory PagesResponse.fromJSON(Map<dynamic, dynamic> json) {
    var jsonArray = (json["pages"] ?? []) as List;
    List<Pages> pagesList = jsonArray
        .map((jsonArrayNesnesi) => Pages.fromJSON(jsonArrayNesnesi))
        .toList();

    return PagesResponse(json["success"] as int?, pagesList);
  }
}

class ExperiencesResponse {
  int? success;
  late List<Experiences> experiencesList;

  ExperiencesResponse(
    this.success,
    this.experiencesList,
  );

  factory ExperiencesResponse.fromJSON(Map<dynamic, dynamic> json) {
    var jsonArray = (json["experiences"] ?? []) as List;
    List<Experiences> experiencesList = jsonArray
        .map((jsonArrayNesnesi) => Experiences.fromJSON(jsonArrayNesnesi))
        .toList();

    return ExperiencesResponse(json["success"] as int?, experiencesList);
  }
}
