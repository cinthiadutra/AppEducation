import 'dart:convert';

class RankingModel {
  String? message;
  List<String>? data;
  List<String>? error;
  RankingModel({
    this.message,
    this.data,
    this.error,
  });

  @override
  String toString() =>
      'ChallengeModel(message: $message, data: $data, error: $error)';

  factory RankingModel.fromMap(Map<String, dynamic> map) {
    return RankingModel(
      message: map['message'],
      data: map['data'] != null
          ? List<String>.from(map['data'])
          : null,
      error: List<String>.from(map['error']??[]),
    );
  }

  factory RankingModel.fromJson(String source) =>
      RankingModel.fromMap(json.decode(source));

}

