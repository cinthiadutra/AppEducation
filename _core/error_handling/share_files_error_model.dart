
import 'package:flutter_appexp/_core/error_handling/crash_analytics_interface.dart';
import 'package:flutter_appexp/_core/error_handling/crash_analytics_service.dart';
import 'package:flutter_appexp/_core/error_handling/http_error.dart';
import 'package:get/get.dart';

import 'target_exception_models.dart';

class ShareFilesException implements ExceptionInterface {
  final ICrashAnalyticsInterface _crashAnalytics =
      Get.find<CrashAnalyticsService>();
  final AppExceptionModel exceptionModel;
  final String errorType;

  @override
  final String description;
  ShareFilesException({
    required this.exceptionModel,
    required this.errorType,
    required this.description,
  });

  Future<void> makeCrashReportLogToDatabase(String url) async {
    await _crashAnalytics.sendCrashLogToDatabase(
      erro: exceptionModel.erro,
      description: description,
      data: exceptionModel.data,
      otherDetailOfError: exceptionModel.otherDetailOfError,
      errorType: errorType,
      stackTrace: exceptionModel.stackTrace,
    );
  }
}

class ShareFilePackageInternalFailure extends ShareFilesException {
  static const String errorTypeText = 'Share File Package Internal Failure';
  static const String errorDescription = 'Erro ao compartilhar a imagem';

  ShareFilePackageInternalFailure({
    required AppExceptionModel exceptionModel,
  }) : super(
          exceptionModel: exceptionModel,
          errorType: errorTypeText,
          description: errorDescription,
        );
}

class CantLaunchUrlInternalFailure extends ShareFilesException {
  static const String errorTypeText = 'Share File Package Internal Failure';
  static const String errorDescription =
      'Erro ao desconhecido ao tentar abrir o link.';

  CantLaunchUrlInternalFailure({
    required AppExceptionModel exceptionModel,
  }) : super(
          exceptionModel: exceptionModel,
          errorType: errorTypeText,
          description: errorDescription,
        );
}

class ShareFileUnknownFailure extends ShareFilesException {
  static const String errorTypeText = 'Share File Unknown Failure';
  static const String errorDescription = 'Um erro desconhecido ocorreu.';

  ShareFileUnknownFailure({
    required AppExceptionModel exceptionModel,
  }) : super(
          exceptionModel: exceptionModel,
          errorType: errorTypeText,
          description: errorDescription,
        );
}
