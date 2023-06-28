// To parse this JSON data, do
//
//     final challengeGetAll = challengeGetAllFromMap(jsonString);

import 'dart:convert';
import 'dart:ffi';

class ChallengeGetAll {
  ChallengeGetAll({
    this.message,
    this.data,
    this.error,
  });

  final String? message;
  final ChallengeGet? data;
  final List<dynamic>? error;

  factory ChallengeGetAll.fromJson(String str) =>
      ChallengeGetAll.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChallengeGetAll.fromMap(Map<String, dynamic> json) => ChallengeGetAll(
        message: json["message"],
        data: json["data"] == null
            ? null
            : ChallengeGet.fromMap(json["data"]),
        error: json["error"] == null
            ? []
            : List<dynamic>.from(json["error"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": data?.toMap(),
        "error": error == null ? [] : List<dynamic>.from(error!.map((x) => x)),
      };
}

class ChallengeGet {
  ChallengeGet({
    this.id,
    this.title,
    this.description,
    this.isAvailable,
    this.schoolGrades,
    this.dateTimeCreated,
    this.dateTimeOpening,
    this.dateTimeClosing,
    this.contents,
    this.pointSkills,
  });

  final String? id;
  final String? title;
  final String? description;
  final bool? isAvailable;
  final List<String>? schoolGrades;
  final String? dateTimeCreated;
  final String? dateTimeOpening;
  final String? dateTimeClosing;
  final List<Content>? contents;
  final List<PointSkill>? pointSkills;

  factory ChallengeGet.fromJson(String str) =>
      ChallengeGet.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChallengeGet.fromMap(Map<String, dynamic> json) => ChallengeGet(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        isAvailable: json["isAvailable"],
        schoolGrades: json["school_grades"] == null
            ? []
            : List<String>.from(json["school_grades"]!.map((x) => x)),
        dateTimeCreated: json["date_time_created"],
        dateTimeOpening: json["date_time_opening"],
        dateTimeClosing: json["date_time_closing"],
        contents: json["contents"] == null
            ? []
            : List<Content>.from(
                json["contents"]!.map((x) => Content.fromMap(x))),
        pointSkills: json["point_skills"] == null
            ? []
            : List<PointSkill>.from(
                json["point_skills"]!.map((x) => PointSkill.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "isAvailable": isAvailable,
        "school_grades": schoolGrades == null
            ? []
            : List<dynamic>.from(schoolGrades!.map((x) => x)),
        "date_time_created": dateTimeCreated,
        "date_time_opening": dateTimeOpening,
        "date_time_closing": dateTimeClosing,
        "contents": contents == null
            ? []
            : List<dynamic>.from(contents!.map((x) => x.toMap())),
        "point_skills": pointSkills == null
            ? []
            : List<dynamic>.from(pointSkills!.map((x) => x.toMap())),
      };
}

class Content {
  Content({
    this.id,
    this.title,
    this.thumbnail,
    this.description,
    this.isUserCompleted,
  });

  final String? id;
  final String? title;
  final String? thumbnail;
  final String? description;
  final bool? isUserCompleted;

  factory Content.fromJson(String str) => Content.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Content.fromMap(Map<String, dynamic> json) => Content(
        id: json["id"],
        title: json["title"],
        thumbnail: json["thumbnail"],
        description: json["description"],
        isUserCompleted: json["isUserCompleted"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "thumbnail": thumbnail,
        "description": description,
        "isUserCompleted": isUserCompleted,
      };
}

class PointSkill {
  PointSkill({
    this.totalExperienceIncrease,
    this.skillsInfo,
  });

  final int? totalExperienceIncrease;
  final SkillsInfo? skillsInfo;

  factory PointSkill.fromJson(String str) =>
      PointSkill.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PointSkill.fromMap(Map<String, dynamic> json) => PointSkill(
        totalExperienceIncrease: json["total_experience_increase"],
        skillsInfo: json["skills_info"] == null
            ? null
            : SkillsInfo.fromMap(json["skills_info"]),
      );

  Map<String, dynamic> toMap() => {
        "total_experience_increase": totalExperienceIncrease,
        "skills_info": skillsInfo?.toMap(),
      };
}

class SkillsInfo {
  SkillsInfo({
    this.name,
    this.image,
  });

  final String? name;
  final String? image;

  factory SkillsInfo.fromJson(String str) =>
      SkillsInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SkillsInfo.fromMap(Map<String, dynamic> json) => SkillsInfo(
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "image": image,
      };
}
