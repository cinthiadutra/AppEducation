import 'package:flutter/material.dart';
import '../_core/app_export.dart';

class CAchievementCircle extends StatelessWidget {
  final String? icon;
  final String subTitle;
  final String? image;

  const CAchievementCircle({
    super.key,
    this.icon,
    required this.subTitle,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonImageView(
          svgPath: icon,
          url: image,
          height: getSize(
            54.00,
          ),
          width: getSize(
            54.00,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          subTitle,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: Pallete.greyAchSubTitle,
          ),
        ),
      ],
    );
  }
}
