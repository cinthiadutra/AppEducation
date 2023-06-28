
import 'package:flutter_appexp/_core/error_handling/crash_analytics_interface.dart';
import 'package:flutter_appexp/_core/error_handling/crash_analytics_service.dart';
import 'package:get/get.dart';

import 'http_error.dart';
import 'target_exception_models.dart';

class StorageException implements ExceptionInterface {
  final ICrashAnalyticsInterface _crashAnalytics =
      Get.find<CrashAnalyticsService>();
  final AppExceptionModel exceptionModel;
  final String errorType;
  @override
  final String description;
  StorageException({
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

class NoDataInMemoryAddress extends StorageException {
  static const String errorTypeText = 'No Data In Memory Address';
  static const String errorDescription =
      'Erro ao tentar obter uma informação do usuário.';

  NoDataInMemoryAddress({
    required AppExceptionModel exceptionModel,
  }) : super(
          exceptionModel: exceptionModel,
          errorType: errorTypeText,
          description: errorDescription,
        );
}

class UnknownStorageException extends StorageException {
  static const String errorTypeText = 'Unknown Storage Exception';
  static const String errorDescription =
      'Erro desconhecido ao tentar obter uma informação do usuário.';

  UnknownStorageException({
    required AppExceptionModel exceptionModel,
  }) : super(
          exceptionModel: exceptionModel,
          errorType: errorTypeText,
          description: errorDescription,
        );
}
