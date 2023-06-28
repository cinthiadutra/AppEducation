// To parse this JSON data, do
//
//     final responseErrorModel = responseErrorModelFromMap(jsonString);

import 'dart:convert';
import 'package:equatable/equatable.dart';

class ResponseErrorModel extends Equatable {
  const ResponseErrorModel({
    required this.type,
    required this.message,
    required this.validations,
    required this.exceptionType,
    required this.businessRequestId,
    required this.errorStamp,
  });

  final String type;
  final String message;
  final List<String> validations;
  final String exceptionType;
  final String businessRequestId;
  final String errorStamp;

  factory ResponseErrorModel.fromJson(String str) =>
      ResponseErrorModel.fromMap(json.decode(str));

  factory ResponseErrorModel.fromMap(Map<String, dynamic> json) {
    return ResponseErrorModel(
      type: json["Type"].toString(),
      message: json["Message"] ??
          'Sistema indisponivel, tente novamente em instantes.',
      validations: json["Validations"] == null
          ? []
          : List<String>.from(json["Validations"].map((x) => x)).toList(),
      exceptionType: json["ExceptionType"].toString(),
      businessRequestId: json["BusinessRequestId"].toString(),
      errorStamp: json["ErrorStamp"] ?? "500",
    );
  }

  @override
  List<Object> get props {
    return [
      type,
      message,
      validations,
      exceptionType,
      businessRequestId,
      errorStamp,
    ];
  }

  ResponseErrorModel copyWith({
    String? type,
    String? message,
    List<String>? validations,
    String? exceptionType,
    String? businessRequestId,
    String? errorStamp,
  }) {
    return ResponseErrorModel(
      type: type ?? this.type,
      message: message ?? this.message,
      validations: validations ?? this.validations,
      exceptionType: exceptionType ?? this.exceptionType,
      businessRequestId: businessRequestId ?? this.businessRequestId,
      errorStamp: errorStamp ?? this.errorStamp,
    );
  }
}
