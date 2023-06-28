// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
class ModelCommentsByEntity {
  ModelCommentsByEntity({
    required this.message,
    this.error,
    this.data,
  });

  final String message;
  final List<String>? error;
  final List<CommentsByEntity>? data;

  @override
  String toString() =>
      'ModelCommentsByEntity(message: $message, error: $error, data: $data)';

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'data': data?.map((x) => x.toMap()).toList(),
      'error': error,
    };
  }

  factory ModelCommentsByEntity.fromMap(Map<String, dynamic> map) {
    return ModelCommentsByEntity(
      message: map['message'] ?? '',
      data: map['data'] != null
        ? List<CommentsByEntity>.from(map['data']?.map((x) => CommentsByEntity.fromMap(x)))
        : null,
      error: List<String>.from(map['error']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelCommentsByEntity.fromJson(String source) =>
      ModelCommentsByEntity.fromMap(json.decode(source));
}

class CommentsByEntity{
  final String? id;
  final String? entity_anchor_id;
  final String? entity_anchor_type;
  final String? user_id;
  final String? message;
  final String? date_created;
  final String? time_created;
  final String? user_name;
  CommentsByEntity({
    this.id,
    this.entity_anchor_id,
    this.entity_anchor_type,
    this.user_id,
    this.message,
    this.date_created,
    this.time_created,
    this.user_name,
    
  });

  factory CommentsByEntity.fromJson(String str) => CommentsByEntity.fromMap(json.decode(str));

  factory CommentsByEntity.fromMap(Map<String, dynamic> map) => CommentsByEntity(
        id: map["id"],
        entity_anchor_id: map["entity_anchor_id"],
        entity_anchor_type: map["entity_anchor_type"],
        user_id: map["user_id"],
        message: map["message"],
        date_created: map["date_created"],
        time_created: map["time_created"],
        user_name: map["user_name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "entity_anchor_id": entity_anchor_id,
        "entity_anchor_type": entity_anchor_type,
        "user_id": user_id,
        "message": message,
        "date_created": date_created,
        "time_created": time_created,
        "user_name": user_name,
      };
}