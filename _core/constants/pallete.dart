import 'package:flutter/material.dart';

class Pallete {
  static const MaterialColor acelerablue =
      MaterialColor(_acelerabluePrimaryValue, <int, Color>{
    50: Color(0xFFEBF7F8),
    100: Color(0xFFCCEBEF),
    200: Color(0xFFAADEE4),
    300: Color(0xFF88D1D9),
    400: Color(0xFF6FC7D0),
    500: Color(_acelerabluePrimaryValue),
    600: Color(0xFF4EB7C2),
    700: Color(0xFF44AEBB),
    800: Color(0xFF3BA6B4),
    900: Color(0xFF2A98A7),
  });
  static const int _acelerabluePrimaryValue = 0xFF55BDC8;

  static const MaterialColor acelerablueAccent =
      MaterialColor(_acelerablueAccentValue, <int, Color>{
    100: Color(0xFFE9FCFF),
    200: Color(_acelerablueAccentValue),
    400: Color(0xFF83EFFF),
    700: Color(0xFF69ECFF),
  });
  static const int _acelerablueAccentValue = 0xFFB6F6FF;

  static const Color yellow = Color(0xAAfcc010);

  static const Color blueDark = Color.fromARGB(255, 1, 120, 126);

  static const Color bottomNavigationBackground = Color(0xAAedf3f8);

  static const Color orangeTitle = Color.fromARGB(255, 232, 113, 9);

  static const Color greyDivider = Color.fromARGB(255, 244, 244, 244);

  static const Color greyComments = Color.fromARGB(255, 230, 230, 230);

  static const Color greyCommentsText = Color.fromARGB(255, 184, 184, 184);

  static const Color greyIcon = Color.fromARGB(255, 107, 107, 107);

  static const Color blackTitleLocal = Color.fromARGB(255, 51, 51, 51);

  static const Color blueProgress = Color.fromARGB(255, 155, 236, 240);

  static const Color greyProgress = Color.fromARGB(255, 234, 239, 241);

  static const Color purpleAchShadow = Color.fromARGB(76, 150, 0, 219);

  static const Color greyAchSubTitle = Color.fromARGB(255, 130, 130, 130);

  static const Color greenIcon = Color.fromARGB(255, 1, 81, 86);

  static const Color greenDarkTitle = Color(0xAA009DA6);

  static const Color purpleButton = Color(0xAAA702F2);

  // Others

  static Color gray600 = fromHex('#828282');

  static Color gray400 = fromHex('#BFC2C2');

  static Color gray800 = fromHex('#505050');

  static Color orange800t = fromHex('#e87109');
  static Color orange800 = const Color.fromRGBO(232, 113, 9, 1);

  static Color lightGreen400 = fromHex('#a3dd59');

  static Color cyan600 = fromHex('#04b2bc');

  static Color gray200 = fromHex('#e8e8e8');
  static Color gray150 = fromHex('#f3f3f3');

  static Color whiteA700 = fromHex('#ffffff');

  static Color gray100 = fromHex('#f9eeff');

  static Color bluegray50 = fromHex('#eaeff1');

  static Color bluegray100 = fromHex('#d2d2d2');

  static Color cyan101 = fromHex('#befbff');

  static Color bluegray700 = fromHex('#4b5457');

  static Color cyan100 = fromHex('#9bebf0');

  static Color purpleA700 = fromHex('#a602f2');

  static Color black90019 = fromHex('#19000000');

  static Color whiteA701 = fromHex('#fffbff');

  static Color gray803 = fromHex('#505050');

  static Color gray602 = fromHex('#818181');

  static Color gray101 = fromHex('#f9eeff');

  static Color orange200 = fromHex('#ffc38f');

  static Color bluegray900 = fromHex('#333333');

  static Color cyan900 = fromHex('#006973');

  static Color cyan700 = fromHex('#009da6');
  static Color greenCheck = fromHex('#EEFCDB');
   static Color greenTick = fromHex('#46750B');


  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}
