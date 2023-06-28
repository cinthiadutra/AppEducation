import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_appexp/_core/error_handling/crash_analytics_interface.dart';
import 'package:flutter_appexp/_core/error_handling/target_exception_models.dart';
import 'package:get/get.dart';

class CrashAnalyticsService extends GetxService
    implements ICrashAnalyticsInterface {
  @override
  Future<void> sendCrashLogToDatabase({
    required String? erro,
    required String? description,
    required String? data,
    required List<DetailOfError> otherDetailOfError,
    required String? errorType,
    required StackTrace? stackTrace,
  }) async {
    if (FirebaseCrashlytics.instance.isCrashlyticsCollectionEnabled) {
      FirebaseCrashlytics.instance.log("TARGET CUSTOM LOG");
      if (description != null) {
        await FirebaseCrashlytics.instance
            .setCustomKey('description', description);
      }
      if (data != null) {
        await FirebaseCrashlytics.instance.setCustomKey('data', data);
      }
      if (erro != null) {
        await FirebaseCrashlytics.instance.setCustomKey("erro", erro);
      }

      for (var detailOfError in otherDetailOfError) {
        await FirebaseCrashlytics.instance
            .setCustomKey(detailOfError.key, detailOfError.value);
      }

      FirebaseCrashlytics.instance.recordError(errorType, stackTrace);
    }
  }
}
