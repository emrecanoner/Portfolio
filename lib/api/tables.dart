// ignore_for_file: public_member_api_docs, sort_constructors_first
class Educations {
  String? school_name;
  String? starting_date;
  String? ending_date;
  String? grade;
  String? studying_field;
  String? description;
  String? projects;

  Educations(this.school_name, this.starting_date, this.ending_date, this.grade,
      this.studying_field, this.description, this.projects);

  factory Educations.fromJSON(Map<dynamic, dynamic> json) {
    return Educations(
        json['school_name'],
        json['starting_date'],
        json['ending_date'],
        json['grade'],
        json['studying_field'],
        json['description'],
        json['projects']);
  }
}

class Pages {
  String? names;

  Pages(this.names);

  factory Pages.fromJSON(Map<dynamic, dynamic> json) {
    return Pages(
      json['names'],
    );
  }
}

class Experiences {
  String? title;
  String? employment_type;
  String? company_name;
  String? location;
  String? location_type;
  String? starting_date;
  String? ending_date;
  String? description;
  Experiences(
    this.title,
    this.employment_type,
    this.company_name,
    this.location,
    this.location_type,
    this.starting_date,
    this.ending_date,
    this.description,
  );

  factory Experiences.fromJSON(Map<dynamic, dynamic> json) {
    return Experiences(
        json['title'],
        json['employment_type'],
        json['company_name'],
        json['location'],
        json['location_type'],
        json['starting_date'],
        json['ending_date'],
        json['description']);
  }
}
