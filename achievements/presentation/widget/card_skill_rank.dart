import 'package:flutter/material.dart';

import 'package:flutter_appexp/achievements/presentation/widget/skill_little.dart';

class CardSkillsRank extends StatelessWidget {
  final String point;
  final String level;
  final String image;
  const CardSkillsRank({
    Key? key,
    required this.point,
    required this.level,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Column(children: [
    //   Row(children: [
    //     SkillMod(
    //         point: point,
    //         level: level,
    //         image: image),
    //     SkillBig(
    //         point: point,
    //         level: level,
    //         image: image),
    //     SkillMod(
    //         point: point,
    //         level: level,
    //         image: image),
    //   ]),
    return SkillLittle(point: point, level: level, image: image);
  }
}
