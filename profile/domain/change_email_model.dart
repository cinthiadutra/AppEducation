import 'dart:convert';

import 'package:equatable/equatable.dart';

class ChangeEmailModel extends Equatable {
  final String id;
  final String newEmail;
  const ChangeEmailModel({
    required this.id,
    required this.newEmail,
  });
  @override
  List<Object> get props => [id, newEmail];

  @override
  String toString() => 'ChangeEmailModel(user_id: $id, new_email: $newEmail)';

  Map<String, dynamic> toMap() {
    return {
      'user_id': id,
      'new_email': newEmail,
    };
  }

  factory ChangeEmailModel.fromMap(Map<String, dynamic> map) {
    return ChangeEmailModel(
      id: map['user_id'] ?? '',
      newEmail: map['new_email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChangeEmailModel.fromJson(String source) => ChangeEmailModel.fromMap(json.decode(source));
}
