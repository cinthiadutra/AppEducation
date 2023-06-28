import 'dart:convert';

class SkillsModel {
  String message;
  List<Skills>? data;
  List<String>? error;
  SkillsModel({
    required this.message,
    this.data,
    this.error,
  });

  @override
  String toString() =>
      'SkillsModel(message: $message, data: $data, error: $error)';

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'data': data?.map((x) => x.toMap()).toList(),
      'error': error,
    };
  }

  factory SkillsModel.fromMap(Map<String, dynamic> map) {
    return SkillsModel(
      message: map['message'] ?? '',
      data: map['data'] != null
          ? List<Skills>.from(map['data']?.map((x) => Skills.fromMap(x)))
          : null,
      error: List<String>.from(map['error'] ?? []),
    );
  }

  String toJson() => json.encode(toMap());

  factory SkillsModel.fromJson(String source) =>
      SkillsModel.fromMap(json.decode(source));
}

class Skills {
  Skills({
    required this.skillId,
    required this.points,
    required this.level,
    required this.skill,
  });

  final String skillId;
  final int points;
  final int level;
  final Skill skill;

  factory Skills.fromJson(String str) => Skills.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Skills.fromMap(Map<String, dynamic> json) => Skills(
        skillId: json["skill_id"],
        points: json["points"],
        level: json["level"],
        skill: Skill.fromMap(json["skill"] ?? []),
      );

  Map<String, dynamic> toMap() => {
        "skill_id": skillId,
        "points": points,
        "level": level,
        "skill": skill.toMap(),
      };
}

class Skill {
  Skill({
    required this.id,
    required this.skillId,
    required this.name,
    required this.description,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String id;
  final String skillId;
  final String name;
  final String description;
  final String image;
  final String createdAt;
  final String updatedAt;
  final int v;

  factory Skill.fromJson(String str) => Skill.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Skill.fromMap(Map<String, dynamic> json) => Skill(
        id: json["_id"],
        skillId: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "id": skillId,
        "name": name,
        "description": description,
        "image": image,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
      };
}
