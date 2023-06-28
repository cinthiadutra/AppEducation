
import 'package:flutter_appexp/_core/error_handling/crash_analytics_interface.dart';
import 'package:flutter_appexp/_core/error_handling/crash_analytics_service.dart';
import 'package:get/get.dart';

import 'response_error_model.dart';
import 'target_exception_models.dart';

abstract class ExceptionInterface implements Exception {
  abstract final String description;
}

class HttpRequestException implements ExceptionInterface {
  final AppExceptionModel exceptionModel;
  final String errorType;
  @override
  final String description;
  final ResponseErrorModel? errorModel;
  HttpRequestException({
    required this.exceptionModel,
    required this.errorType,
    required this.errorModel,
    required this.description,
  });

  Future<void> makeCrashReportLogToDatabase() async {
    try {
      final ICrashAnalyticsInterface crashAnalytics =
          Get.find<CrashAnalyticsService>();
      await crashAnalytics.sendCrashLogToDatabase(
        erro: exceptionModel.erro,
        description: description,
        data: exceptionModel.data,
        otherDetailOfError: exceptionModel.otherDetailOfError,
        errorType: errorType,
        stackTrace: exceptionModel.stackTrace,
      );
    } catch (_) {}
  }
}

/// Erro genérico não coberto na requisição HTTP
class HttpBadFormatRequestFailure extends HttpRequestException {
  static const String errorTypeText = 'Http Bad Format Request Failure';
  final String errorDescription;
  final dynamic data;

  HttpBadFormatRequestFailure({
    required AppExceptionModel exceptionModel,
    ResponseErrorModel? responseErrorModel,
    this.data,
    this.errorDescription =
        "Uma ação inválida provocou um resultado inesperado. Tente novamente.",
  }) : super(
          exceptionModel: exceptionModel,
          errorType: errorTypeText,
          errorModel: responseErrorModel,
          description: errorDescription,
        );
}

/// Erro do cliente [ INTERVALO DE 4xx ]
class HttpClientErrorFailure extends HttpRequestException {
  static const String errorTypeText = 'Http Client Error Failure';
  final String errorDescription;

  HttpClientErrorFailure({
    required AppExceptionModel exceptionModel,
    ResponseErrorModel? responseErrorModel,
    this.errorDescription =
        'Ocorreu um erro inesperado ao se comunicar com o servidor. Tente novamente mais tarde.',
  }) : super(
          exceptionModel: exceptionModel,
          errorType: errorTypeText,
          errorModel: responseErrorModel,
          description: errorDescription,
        );
}

class HttpUnauthorizedFailure extends HttpRequestException {
  static const String errorTypeText = 'Http Unauthorized Failure';
  final String errorDescription;

  HttpUnauthorizedFailure({
    required AppExceptionModel exceptionModel,
    ResponseErrorModel? responseErrorModel,
    this.errorDescription =
        'Não autorizado a essa operação. Tente logar novamente',
  }) : super(
          exceptionModel: exceptionModel,
          errorType: errorTypeText,
          errorModel: responseErrorModel,
          description: errorDescription,
        );
}

/// Erro do servidor [ INTERVALO DE 5xx ]
class HttpServerErrorFailure extends HttpRequestException {
  static const String errorTypeText = 'Http Server Error Failure';
  final String errorDescription;

  HttpServerErrorFailure({
    required AppExceptionModel exceptionModel,
    ResponseErrorModel? responseErrorModel,
    this.errorDescription =
        'Aconteceu um erro com o nosso servidor. Tente novamente mais tarde.',
  }) : super(
          exceptionModel: exceptionModel,
          errorType: errorTypeText,
          errorModel: responseErrorModel,
          description: errorDescription,
        );
}

/// Erro quando conseguimos obter um dado do servidor, mas na hora de fazer o
/// casting dele pra um objeto nosso aconteceu um erro.
class HttpObjectCastingFailure extends HttpRequestException {
  static const String errorTypeText = 'Http Server Error Failure';
  final String errorDescription;

  HttpObjectCastingFailure({
    required AppExceptionModel exceptionModel,
    ResponseErrorModel? responseErrorModel,
    this.errorDescription =
        'Aconteceu um erro com o nosso servidor. Tente novamente mais tarde.',
  }) : super(
          exceptionModel: exceptionModel,
          errorType: errorTypeText,
          errorModel: responseErrorModel,
          description: errorDescription,
        );
}

/// Status code do erro não retornado na requisição
class HttpNoStatusCodeFailure extends HttpRequestException {
  static const String errorTypeText = 'Http No Status Code Failure';
  final String errorDescription;

  HttpNoStatusCodeFailure(
      {required AppExceptionModel exceptionModel,
      ResponseErrorModel? responseErrorModel,
      this.errorDescription =
          'Ocorreu um erro indefinido no servidor. Tente novamente mais tarde.'})
      : super(
          exceptionModel: exceptionModel,
          errorType: errorTypeText,
          errorModel: responseErrorModel,
          description: errorDescription,
        );
}

/// Erro quando a resposta da requisição é nula, o sistema está indisponivel
class HttpUnavailableSystemFailure extends HttpRequestException {
  static const String errorTypeText = 'Http Unavailable System Failure';
  static const String errorDescription = "Sistema temporariamente fora do ar, "
      "tente novamente em instantes.";

  HttpUnavailableSystemFailure({
    required AppExceptionModel exceptionModel,
    ResponseErrorModel? responseErrorModel,
  }) : super(
          exceptionModel: exceptionModel,
          errorType: errorTypeText,
          errorModel: responseErrorModel,
          description: errorDescription,
        );
}

/// Erro genérico não coberto na requisição HTTP
class UnknownHttpFailure extends HttpRequestException {
  static const String errorTypeText = 'Unknown Http Failure';
  final String errorDescription;

  UnknownHttpFailure({
    required AppExceptionModel exceptionModel,
    ResponseErrorModel? responseErrorModel,
    String error = 'Ocorreu um erro desconhecido. Tente novamente mais tarde.',
  })  : errorDescription = error,
        super(
          exceptionModel: exceptionModel,
          errorType: errorTypeText,
          errorModel: responseErrorModel,
          description: error,
        );
}
