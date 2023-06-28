import 'package:flutter/material.dart';
import '../_core/app_export.dart';

class CDivider extends StatelessWidget {
  const CDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      color: Pallete.greyDivider,
      child: SizedBox(width: MediaQuery.of(context).size.width),
    );
  }
}
