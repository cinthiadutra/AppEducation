import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

abstract class IntegracaoFirebase {
  ///METODO QUE INCIA O FIREBASE
  static Future<void> integracaoFirebase() async {
    // INICIA FIREBASE
    await Firebase.initializeApp();
    // SETA CRASH ANALYTICS
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    // SETA O FLUTTER ERRO NO CRASH
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    // SETA O QUE ESTÁ OUVINDO DE NOTIFICAÇÕES
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}
