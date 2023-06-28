import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../_core/app_export.dart';

class CSubTitle extends StatelessWidget {
  final String text;
  final double sizeText;
  final FontWeight fontW;

  const CSubTitle(
    this.text, {
    super.key,
    this.fontW = FontWeight.w500,
    this.sizeText = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lexend(
        textStyle: TextStyle(
          color: Pallete.orange800,
          fontSize: sizeText,
          fontWeight: fontW,
          overflow: TextOverflow.ellipsis,
          fontFamily: 'Lexend',
          letterSpacing: 0.10,
          height: 1.00,
        ),
      ),
      textAlign: TextAlign.left,
    );
  }
}
