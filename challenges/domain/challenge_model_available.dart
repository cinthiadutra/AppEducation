// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class ChallengeModelAvailable {
  String? message;
  List<ChallengeAvailable>? data;
  List<String>? error;
  ChallengeModelAvailable({
    this.message,
    this.data,
    this.error,
  });

  @override
  String toString() =>
      'ChallengeModelAvailable(message: $message, data: $data, error: $error)';

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'data': data?.map((x) => x.toMap()).toList(),
      'error': error,
    };
  }

  factory ChallengeModelAvailable.fromMap(Map<String, dynamic> map) {
    return ChallengeModelAvailable(
      message: map['message'],
      data: map['data'] != null
          ? List<ChallengeAvailable>.from(
              map['data']?.map((x) => ChallengeAvailable.fromMap(x)))
          : null,
      error: List<String>.from(map['error']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChallengeModelAvailable.fromJson(String source) =>
      ChallengeModelAvailable.fromMap(json.decode(source));
}

class ChallengeAvailable {
  final String? id;
  final String? title;
  final String? description;

  ChallengeAvailable({
    this.id,
    this.title,
    this.description,
  });

  @override
  String toString() =>
      'ChallengeAvailable(id: $id, title: $title, description: $description)';

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  factory ChallengeAvailable.fromMap(Map<String, dynamic> map) {
    return ChallengeAvailable(
      id: map['id']?.toString(),
      title: map['title']?.toString(),
      description: map['description']?.toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChallengeAvailable.fromJson(String source) =>
      ChallengeAvailable.fromMap(json.decode(source));
}
//
// class SubscribedChallenge {
//   SubscribedChallenge({
//     required this.id,
//     required this.isConcluded,
//     required this.challengeInformationAvailable,
//     required this.totalContents,
//     required this.totalContentsCompleted,
//   });
//
//   final String id;
//   final bool isConcluded;
//   final ChallengeInformationAvailable challengeInformationAvailable;
//   final int totalContents;
//   final int totalContentsCompleted;
//
//   factory SubscribedChallenge.fromJson(String str) =>
//       SubscribedChallenge.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory SubscribedChallenge.fromMap(Map<String, dynamic> json) =>
//       SubscribedChallenge(
//         id: json["id"],
//         isConcluded: json["isConcluded"],
//         challengeInformationAvailable: ChallengeInformationAvailable.fromMap(
//             json["challenge_information"]),
//         totalContents: json["total_contents"],
//         totalContentsCompleted: json["total_contents_completed"],
//       );
//
//   Map<String, dynamic> toMap() => {
//         "id": id,
//         "isConcluded": isConcluded,
//         "challenge_information": challengeInformationAvailable.toMap(),
//         "total_contents": totalContents,
//         "total_contents_completed": totalContentsCompleted,
//       };
// }
//
// class ChallengeInformationAvailable {
//   ChallengeInformationAvailable({
//     required this.title,
//     required this.description,
//     required this.contents,
//     required this.dateTimeCreated,
//     required this.dateTimeOpening,
//     required this.dateTimeClosing,
//   });
//
//   final String title;
//   final String description;
//   final List<String> contents;
//   final String dateTimeCreated;
//   final String dateTimeOpening;
//   final String dateTimeClosing;
//
//   factory ChallengeInformationAvailable.fromJson(String str) =>
//       ChallengeInformationAvailable.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory ChallengeInformationAvailable.fromMap(Map<String, dynamic> json) =>
//       ChallengeInformationAvailable(
//         title: json["title"],
//         description: json["description"],
//         contents: List<String>.from(json["contents"].map((x) => x)),
//         dateTimeCreated: json["dateTimeCreated"] ?? '',
//         dateTimeOpening: json["dateTimeOpening"] ?? '',
//         dateTimeClosing: json["dateTimeClosing"] ?? '',
//       );
//
//   Map<String, dynamic> toMap() => {
//         "title": title,
//         "description": description,
//         "contents": List<dynamic>.from(contents.map((x) => x)),
//         "dateTimeCreated": dateTimeCreated,
//         "dateTimeOpening": dateTimeOpening,
//         "dateTimeClosing": dateTimeClosing,
//       };
// }
