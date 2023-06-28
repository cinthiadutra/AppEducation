import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../_core/app_export.dart';

class CTitleLocal extends StatelessWidget {
  final String text;
  final double? size;
  const CTitleLocal(this.text, {super.key, this.size = 12});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
          textStyle: TextStyle(
        color: Pallete.blackTitleLocal,
        fontSize: size,
        fontWeight: FontWeight.w500,
      )),
    );
  }
}

//  style: TextStyle(
//                                               color: Pallete.gray803,
//                                               fontSize: getFontSize(
//                                                 12,
//                                               ),
//                                               fontFamily: 'Inter',
//                                               fontWeight: FontWeight.w500,
//                                               letterSpacing: 0.50,
//                                               height: 1.33,
