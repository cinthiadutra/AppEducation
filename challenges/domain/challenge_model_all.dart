// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';

//Uri ║ https://dev-api.expacer.com/game/challenge/80994838-7494-4fb2-a450-e00346e47ba0

class ChallengeModellAll {
  String? message;
  ChallengeModel? data;
  List<String>? error;
  ChallengeModellAll({
    this.message,
    this.data,
    this.error,
  });

  @override
  String toString() =>
      'ChallengeModell(message: $message, data: $data, error: $error)';

  factory ChallengeModellAll.fromMap(Map<String, dynamic> map) {
    return ChallengeModellAll(
      message: map['message'],
      data: ChallengeModel.fromMap(map['data']),
      error: List<String>.from(map['error']),
    );
  }

  factory ChallengeModellAll.fromJson(String source) =>
      ChallengeModellAll.fromMap(json.decode(source));
}

class ChallengeModel {
  List<SubscribedChallenge>? subscribed_challenges;
  final int? number_challenges;
  final int? number_completed_challenges;
  ChallengeModel({
    this.subscribed_challenges,
    this.number_challenges,
    this.number_completed_challenges,
  });

  @override
  String toString() =>
      'ChallengeModel(subscribed_challenges: $subscribed_challenges, number_challenges: $number_challenges, number_completed_challenges: $number_completed_challenges)';

  Map<String, dynamic> toMap() {
    return {
      'subscribed_challenges':
          subscribed_challenges?.map((x) => x.toMap()).toList(),
      'number_challenges': number_challenges,
      'number_completed_challenges': number_completed_challenges,
    };
  }

  factory ChallengeModel.fromMap(Map<String, dynamic> map) {
    return ChallengeModel(
      subscribed_challenges: map['subscribed_challenges'] != null
          ? List<SubscribedChallenge>.from(map['subscribed_challenges']
              ?.map((x) => SubscribedChallenge.fromMap(x)))
          : null,
      number_challenges: map['number_challenges']?.toInt(),
      number_completed_challenges: map['number_completed_challenges']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChallengeModel.fromJson(String source) =>
      ChallengeModel.fromMap(json.decode(source));
}

class SubscribedChallenge {
  SubscribedChallenge({
    required this.isConcluded,
    required this.challengeInformation,
    required this.totalContents,
    required this.totalContentsCompleted,
  });

  final bool isConcluded;
  final ChallengeInformation challengeInformation;
  final int totalContents;
  final int totalContentsCompleted;

  factory SubscribedChallenge.fromJson(String str) =>
      SubscribedChallenge.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubscribedChallenge.fromMap(Map<String, dynamic> json) =>
      SubscribedChallenge(
        isConcluded: json["isConcluded"],
        challengeInformation:
            ChallengeInformation.fromMap(json["challenge_information"]),
        totalContents: json["total_contents"],
        totalContentsCompleted: json["total_contents_completed"],
      );

  Map<String, dynamic> toMap() => {
        "isConcluded": isConcluded,
        "challenge_information": challengeInformation.toMap(),
        "total_contents": totalContents,
        "total_contents_completed": totalContentsCompleted,
      };
}

class ChallengeInformation extends Equatable {
  const ChallengeInformation(
      {required this.title,
      required this.description,
      required this.contents,
      required this.challengeId});

  final String title;
  final String description;
  final List<String> contents;
  final String challengeId;

  @override
  String toString() {
    return 'ChallengeInformation(title: $title, description: $description, contents: $contents, challenge_id: $challengeId )';
  }

  @override
  List<Object> get props {
    return [title, description, contents, challengeId];
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'contents': contents,
      'challenge_id': challengeId,
    };
  }

  factory ChallengeInformation.fromMap(Map<String, dynamic> map) {
    return ChallengeInformation(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      contents: List<String>.from(map['contents']),
      challengeId: map['challenge_id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChallengeInformation.fromJson(String source) =>
      ChallengeInformation.fromMap(json.decode(source));
}
