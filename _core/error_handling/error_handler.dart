
import 'package:flutter_appexp/_core/error_handling/http_error.dart';
import 'package:flutter_appexp/_core/error_handling/test_config.dart';
import 'package:flutter_appexp/_dialogs/app_dialog.dart';

class ErrorHandler {
  const ErrorHandler._internal();
  static ErrorHandler get i => const ErrorHandler._internal();

  void manageError(ExceptionInterface error) {
    if (error is HttpRequestException) {
      final isTest = TestConfig.isTestMode();
      if (isTest) return;



      AppDialog.i.erro(
        texto: error.description,

      );

      error.makeCrashReportLogToDatabase();
    } else {
      if (TestConfig.isTestMode()) return;
      AppDialog.i.erro(texto: error.description);
    }
  }
}
