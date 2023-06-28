import 'dart:convert';

import 'package:equatable/equatable.dart';

class ChangeEmailAssign extends Equatable {
  final String token;
  final String userId;
  final String actualEmail;
  final String newEmail;
  const ChangeEmailAssign({
    required this.token,
    required this.userId,
    required this.actualEmail,
    required this.newEmail,
  });

  @override
  List<Object> get props => [token, userId, actualEmail, newEmail];

  @override
  String toString() {
    return 'ChangeEmailAssign(token: $token, user_id: $userId, actual_email: $actualEmail, new_email: $newEmail)';
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'user_id': userId,
      'actual_email': actualEmail,
      'new_email': newEmail,
    };
  }

  factory ChangeEmailAssign.fromMap(Map<String, dynamic> map) {
    return ChangeEmailAssign(
      token: map['token'] ?? '',
      userId: map['user_id'] ?? '',
      actualEmail: map['actual_email'] ?? '',
      newEmail: map['new_email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChangeEmailAssign.fromJson(String source) => ChangeEmailAssign.fromMap(json.decode(source));
}


