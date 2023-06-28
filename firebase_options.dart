// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBEWqUvj5lvnUyHZsuNg_tMSta_C9botdU',
    appId: '1:1061361002730:web:5bceaa17818e056f26cf93',
    messagingSenderId: '1061361002730',
    projectId: 'expacer-6dad6',
    authDomain: 'expacer-6dad6.firebaseapp.com',
    storageBucket: 'expacer-6dad6.appspot.com',
    measurementId: 'G-05GX26LF8H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCayRveWu0UxCMpTNxsPAnjHoylG5a9XIg',
    appId: '1:1061361002730:android:80daf199856535fb26cf93',
    messagingSenderId: '1061361002730',
    projectId: 'expacer-6dad6',
    storageBucket: 'expacer-6dad6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBjiUDMDPlLzID3DdD96tgOSQ6Zs9v7ITk',
    appId: '1:1061361002730:ios:be34c3bd2977ea2226cf93',
    messagingSenderId: '1061361002730',
    projectId: 'expacer-6dad6',
    storageBucket: 'expacer-6dad6.appspot.com',
    androidClientId: '1061361002730-c3o86vfm9gramicdsn9ge4rfe6t40b6e.apps.googleusercontent.com',
    iosClientId: '1061361002730-sm6709175r1fv4fehepbs5ot4p6jj0bh.apps.googleusercontent.com',
    iosBundleId: 'exp.acelera.flutterAppexp',
  );
}