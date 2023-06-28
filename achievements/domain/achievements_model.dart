import 'dart:convert';

class AchievementsModel {
  final String message;
  Achievement? data;
  final List<String>? error;
  AchievementsModel({
    required this.message,
    this.data,
    this.error,
  });
  @override
  String toString() =>
      'AchievementsModel(message: $message, data: $data, erro: $error)';

  factory AchievementsModel.fromMap(Map<String, dynamic> map) {
    return AchievementsModel(
      message: map['message'] ?? '',
      data: Achievement.fromMap(map['data']),
      error: List<String>.from(map['error'] ?? []),
    );
  }

  factory AchievementsModel.fromJson(String source) =>
      AchievementsModel.fromMap(json.decode(source));
}

class Achievement {
  final FirstPlaceAchievement? first;
  final AboveUserAchievement? aboveUser;
  final UserAchievement? user;
  final UnderUserAchievement? underUser;
  Achievement({
    this.first,
    this.aboveUser,
    required this.user,
    this.underUser,
  });

  @override
  String toString() {
    return 'Achievement(first_place: $first, above_user: $aboveUser, user: $user, under_user: $underUser)';
  }

  factory Achievement.fromMap(Map<String, dynamic> map) {
    return Achievement(
      first: map['first_place'] != null
          ? FirstPlaceAchievement.fromMap(map['first_place'])
          : null,
      aboveUser: map['above_user'] != null
          ? AboveUserAchievement.fromMap(map['above_user'])
          : null,
      user: map['user'] != null ? UserAchievement.fromMap(map['user']) : null,
      underUser: map['under_user'] != null
          ? UnderUserAchievement.fromMap(map['under_user'])
          : null,
    );
  }

  factory Achievement.fromJson(String source) =>
      Achievement.fromMap(json.decode(source));
}

class FirstPlaceAchievement {
  final String userId;
  final int ranking;
  final int points;
  final String lastName;
  final String name;
  FirstPlaceAchievement({
    required this.userId,
    required this.ranking,
    required this.lastName,
    required this.name,
    required this.points,
  });

  @override
  String toString() =>
      'FirstPlaceAchievement(user_id: $userId, ranking: $ranking, points: $points, last_name: $lastName, name:$name)';

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'ranking': ranking,
      'points': points,
      'name': name,
      'last_name': lastName
    };
  }

  factory FirstPlaceAchievement.fromMap(Map<String, dynamic> map) {
    return FirstPlaceAchievement(
      userId: map['user_id'] ?? '',
      ranking: map['ranking']?.toInt() ?? 0,
      points: map['points']?.toInt() ?? 0,
      name: map['name'] ?? '',
      lastName: map['last_name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FirstPlaceAchievement.fromJson(String source) =>
      FirstPlaceAchievement.fromMap(json.decode(source));
}

class AboveUserAchievement {
  final String userId;
  final int ranking;
  final int points;
  final String lastName;
  final String name;

  AboveUserAchievement(
      {required this.userId,
      required this.ranking,
      required this.points,
      required this.lastName,
      required this.name});

  @override
  String toString() =>
      'AboveUserAchievement(user_id: $userId, ranking: $ranking, points: $points, name: $name, last_name: $lastName )';

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'ranking': ranking,
      'points': points,
      'name': name,
      'last_name': lastName
    };
  }

  factory AboveUserAchievement.fromMap(Map<String, dynamic> map) {
    return AboveUserAchievement(
      userId: map['user_id'] ?? '',
      ranking: map['ranking']?.toInt() ?? 0,
      points: map['points']?.toInt() ?? 0,
      name: map['name'] ?? '',
      lastName: map['last_name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AboveUserAchievement.fromJson(String source) =>
      AboveUserAchievement.fromMap(json.decode(source));
}

class UnderUserAchievement {
  final String userId;
  final int ranking;
  final int points;
  final String lastName;
  final String name;

  UnderUserAchievement(
      {required this.userId,
      required this.ranking,
      required this.points,
      required this.name,
      required this.lastName});

  @override
  String toString() =>
      'UnderUserAchievement(user_id: $userId, ranking: $ranking, points: $points, name: $name, last_name: $lastName )';

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'ranking': ranking,
      'points': points,
      'name': name,
      'last_name': lastName
    };
  }

  factory UnderUserAchievement.fromMap(Map<String, dynamic> map) {
    return UnderUserAchievement(
      userId: map['user_id'] ?? '',
      ranking: map['ranking']?.toInt() ?? 0,
      points: map['points']?.toInt() ?? 0,
      name: map['name'] ?? '',
      lastName: map['last_name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UnderUserAchievement.fromJson(String source) =>
      UnderUserAchievement.fromMap(json.decode(source));
}

class UserAchievement {
  final String userId;
  final int ranking;
  final int points;
  final String lastName;
  final String name;
  UserAchievement(
      {required this.userId,
      required this.ranking,
      required this.points,
      required this.name,
      required this.lastName});

  @override
  String toString() =>
      'UserAchievement(user_id: $userId, ranking: $ranking, points: $points, name: $name, last_name: $lastName )';

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'ranking': ranking,
      'points': points,
      'name': name,
      'last_name': lastName
    };
  }

  factory UserAchievement.fromMap(Map<String, dynamic> map) {
    return UserAchievement(
      userId: map['user_id'] ?? '',
      ranking: map['ranking']?.toInt() ?? 0,
      points: map['points']?.toInt() ?? 0,
      name: map['name'] ?? '',
      lastName: map['last_name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAchievement.fromJson(String source) =>
      UserAchievement.fromMap(json.decode(source));
}
