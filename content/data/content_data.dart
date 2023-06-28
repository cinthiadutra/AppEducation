// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class ModelContentData {
  final String message;
  final DataComments? data;
  final String? erro;
  ModelContentData({
    required this.message,
    this.data,
    this.erro,
  });

  @override
  String toString() =>
      'ModelContentData(message: $message, data: $data, erro: $erro)';

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'data': data,
      'erro': erro,
    };
  }

  factory ModelContentData.fromMap(Map<String, dynamic> map) {
    return ModelContentData(
      message: map['message'] ?? '',
      data: DataComments.fromMap(map['data']),
      erro: map['erro'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelContentData.fromJson(String source) =>
      ModelContentData.fromMap(json.decode(source));
}

class DataComments {
  String? entity_anchor_id;
  String? entity_anchor_type;
  String? user_id;
  String? message;
  DataComments({
    this.entity_anchor_id,
    this.entity_anchor_type,
    this.user_id,
    this.message,
  });

  @override
  String toString() {
    return 'DataComments(entity_anchor_id: $entity_anchor_id, entity_anchor_type: $entity_anchor_type, user_id: $user_id, message: $message)';
  }

  Map<String, dynamic> toMap() {
    return {
      'entity_anchor_id': entity_anchor_id,
      'entity_anchor_type': entity_anchor_type,
      'user_id': user_id,
      'message': message,
    };
  }

  factory DataComments.fromMap(Map<String, dynamic> map) {
    return DataComments(
      entity_anchor_id: map['entity_anchor_id'],
      entity_anchor_type: map['entity_anchor_type'],
      user_id: map['user_id'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DataComments.fromJson(String source) =>
      DataComments.fromMap(json.decode(source));
}
