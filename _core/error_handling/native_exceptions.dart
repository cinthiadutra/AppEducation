
import 'package:flutter_appexp/_core/error_handling/crash_analytics_interface.dart';
import 'package:flutter_appexp/_core/error_handling/crash_analytics_service.dart';
import 'package:flutter_appexp/_core/error_handling/http_error.dart';
import 'package:get/get.dart';

import 'target_exception_models.dart';

class NativeException implements ExceptionInterface {
  final ICrashAnalyticsInterface _crashAnalytics =
      Get.find<CrashAnalyticsService>();
  final AppExceptionModel exceptionModel;
  final String errorType;
  @override
  final String description;
  NativeException({
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

class UnknownNativeFailure extends NativeException {
  static const String errorTypeText = 'Image Not Choosed Failure';
  static const String errorDescription =
      'Nenhuma imagem foi selecionada, escolha uma.';

  UnknownNativeFailure({
    required AppExceptionModel exceptionModel,
  }) : super(
          exceptionModel: exceptionModel,
          errorType: errorTypeText,
          description: errorDescription,
        );
}
