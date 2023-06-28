import 'dart:convert';

class Skill {
  String idSkill;
  String name;
  String urlImage;

  Skill({
    required this.idSkill,
    required this.name,
    required this.urlImage,
  });

  @override
  String toString() => 'Skill(idSkill: $idSkill, name: $name, urlImage: $urlImage)';

  Map<String, dynamic> toMap() {
    return {
      'idSkill': idSkill,
      'name': name,
      'urlImage': urlImage,
    };
  }

  factory Skill.fromMap(Map<String, dynamic> map) {
    return Skill(
      idSkill: map['idSkill'] ?? '',
      name: map['name'] ?? '',
      urlImage: map['urlImage'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Skill.fromJson(String source) => Skill.fromMap(json.decode(source));
}
