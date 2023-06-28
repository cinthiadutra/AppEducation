import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../_core/app_export.dart';

class CTitle extends StatelessWidget {
  final String text;
  final double sizeText;
  final FontWeight fontW;
  final Color color;
  const CTitle(this.text,
      {super.key,
      this.fontW = FontWeight.w700,
      this.sizeText = 24,
      this.color = Pallete.orangeTitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 3,
      style: GoogleFonts.lexend(
        textStyle: TextStyle(
          color: color,
          fontSize: sizeText,
          fontWeight: fontW,
        ),
      ),
      textAlign: TextAlign.left,
      overflow: TextOverflow.fade,
    );
  }
}
