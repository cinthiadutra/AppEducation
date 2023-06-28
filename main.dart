// ignore_for_file: depend_on_referenced_packages, unused_catch_clause

import 'dart:developer';

import 'package:device_information/device_information.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_appexp/_core/flutter_storage.dart';
import 'package:flutter_appexp/login/presentation/login_screen.dart';
import 'package:flutter_appexp/onboarding/presentation/onboarding_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_appexp/_core/Routes/app_pages.dart';
import 'package:flutter_appexp/_core/app_binding.dart';
import 'package:flutter_appexp/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '_core/app_export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final fcmToken = await FirebaseMessaging.instance.getToken();
  log('#################### $fcmToken #######################');

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool firstLogin = prefs.getBool('first_login') ?? true;
  runApp(MyApp(firstLogin: firstLogin));
}

class MyApp extends StatefulWidget {
  final bool firstLogin;
  const MyApp({super.key, this.firstLogin = false});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String imeiNo = '';

    // Platform messages may fail,
    // so we use a try/catch PlatformException.
    try {
      imeiNo = await DeviceInformation.deviceIMEINumber;
    } on PlatformException catch (e) {
      e.message;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      FlutterSecureStorage storage = const FlutterSecureStorage();
      storage.write(key: 'imei', value: imeiNo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBinding(),
      title: 'AppExp',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("pt", ""),
        Locale("en", ""),
        Locale("es", ''),
      ],
      theme: ThemeData(
        primarySwatch: Pallete.acelerablue,
        textTheme: GoogleFonts.lexendTextTheme(),
        checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStatePropertyAll<Color>(Pallete.gray101)),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          toolbarHeight: 68,
          iconTheme: IconThemeData(color: Pallete.blueDark),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 22,
          ),
          actionsIconTheme: IconThemeData(color: Pallete.blueDark),
          titleSpacing: 42,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(24),
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Pallete.greenIcon),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Pallete.blueDark,
          unselectedItemColor: Colors.grey,
          backgroundColor: Pallete.bottomNavigationBackground,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      initialRoute: 'splash',
      home: widget.firstLogin ? const OnboardingScreen() : const LoginScreen(),
      getPages: [
        ...AppPages,
      ],
    );
  }
}
