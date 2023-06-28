
import 'package:flutter_appexp/_core/error_handling/crash_analytics_interface.dart';
import 'package:flutter_appexp/_core/error_handling/crash_analytics_service.dart';
import 'package:flutter_appexp/_core/error_handling/http_error.dart';
import 'package:get/get.dart';

import 'target_exception_models.dart';

class LocalizationPickerException implements ExceptionInterface {
  final ICrashAnalyticsInterface _crashAnalytics =
      Get.find<CrashAnalyticsService>();
  final AppExceptionModel exceptionModel;
  final String errorType;
  @override
  final String description;
  LocalizationPickerException({
    required this.exceptionModel,
    required this.errorType,
    required this.description,
  });

  Future<void> makeCrashReportLogToDatabase() async {
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

class LocalizationDisativatedFailure extends LocalizationPickerException {
  static const String errorTypeText = 'Localization Disativated Failure';
  static const String errorDescription = 'Localização está desativada.';

  LocalizationDisativatedFailure({
    required AppExceptionModel exceptionModel,
  }) : super(
          exceptionModel: exceptionModel,
          errorType: errorTypeText,
          description: errorDescription,
        );
}

class LocalizationPermissionsDeniedFailure extends LocalizationPickerException {
  static const String errorTypeText = 'Localization Permissions Denied Failure';
  static const String errorDescription =
      'Permissões de localização permanentemente negadas.';

  LocalizationPermissionsDeniedFailure({
    required AppExceptionModel exceptionModel,
  }) : super(
          exceptionModel: exceptionModel,
          errorType: errorTypeText,
          description: errorDescription,
        );
}

class LocalizationPermissionsForeverDeniedFailure
    extends LocalizationPickerException {
  static const String errorTypeText =
      'Localization Permissions Forever Denied Failure';
  static const String errorDescription =
      'O aplicativo não recebeu permissão para acessar seu localizador. '
      'Vá em configurações do aplicativo Target Conta Digital, permita o localizador do seu celular e tente novamente.';

  LocalizationPermissionsForeverDeniedFailure({
    required AppExceptionModel exceptionModel,
  }) : super(
          exceptionModel: exceptionModel,
          errorType: errorTypeText,
          description: errorDescription,
        );
}

class UnknownLocalizationFailure extends LocalizationPickerException {
  static const String errorTypeText = 'Unknown Localization Failure';
  static const String errorDescription =
      'Erro desconhecido occoreu ao pegar a localização.';

  UnknownLocalizationFailure({
    required AppExceptionModel exceptionModel,
  }) : super(
          exceptionModel: exceptionModel,
          errorType: errorTypeText,
          description: errorDescription,
        );
}
