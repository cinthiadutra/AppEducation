import 'package:equatable/equatable.dart';

class AppExceptionModel extends Equatable {
  final String? erro;
  final String? data;
  final StackTrace? stackTrace;
  late final List<DetailOfError> otherDetailOfError;

  AppExceptionModel({
    this.erro,
    this.stackTrace,
    this.data,
    List<DetailOfError>? otherDetailOfError,
  }) {
    if (otherDetailOfError == null) {
      this.otherDetailOfError = [];
    } else {
      this.otherDetailOfError = otherDetailOfError;
    }
  }

  @override
  List<Object> get props => [
        if (erro != null) erro!,
        if (data != null) data!,
        if (stackTrace != null) stackTrace!,
        otherDetailOfError,
      ];
}

class DetailOfError {
  final String key;
  final String value;
  DetailOfError({
    required this.key,
    required dynamic value,
  }) : value = value.toString();
}
