// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class ChallengeModelMinimal {
  String? message;
  DataReceiverMinimal? data;
  List<String>? error;
  ChallengeModelMinimal({
    this.message,
    this.data,
    this.error,
  });

  @override
  String toString() =>
      'ChallengeModelMinimal(message: $message, data: $data, error: $error)';

  factory ChallengeModelMinimal.fromMap(Map<String, dynamic> map) {
    return ChallengeModelMinimal(
      message: map['message'],
      data: DataReceiverMinimal.fromMap(map['data']),
      error: List<String>.from(map['error']),
    );
  }

  factory ChallengeModelMinimal.fromJson(String source) =>
      ChallengeModelMinimal.fromMap(json.decode(source));

}

class DataReceiverMinimal {
  final List? subscribed_challenges;
  final int? number_challenges;
  final int? number_completed_challenges;
  DataReceiverMinimal({
    this.subscribed_challenges,
    this.number_challenges,
    this.number_completed_challenges,
  });

  @override
  String toString() =>
      'DataReceiverMinimal(subscribed_challenges: $subscribed_challenges, number_challenges: $number_challenges, number_completed_challenges: $number_completed_challenges)';

  Map<String, dynamic> toMap() {
    return {
      'subscribed_challenges': subscribed_challenges,
      'number_challenges': number_challenges,
      'number_completed_challenges': number_completed_challenges,
    };
  }

  factory DataReceiverMinimal.fromMap(Map<String, dynamic> map) {
    return DataReceiverMinimal(
      subscribed_challenges: map['subscribed_challenges'] ?? '',
      number_challenges: map['number_challenges']?.toInt() ?? 0,
      number_completed_challenges: map['number_completed_challenges']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataReceiverMinimal.fromJson(String source) =>
      DataReceiverMinimal.fromMap(json.decode(source));
}
