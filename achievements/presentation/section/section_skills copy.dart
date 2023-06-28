// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_appexp/_widgets/common_title.dart';
import 'package:flutter_appexp/achievements/domain/skills_model.dart';
import 'package:flutter_appexp/achievements/presentation/widget/skill_big.dart';
import 'package:flutter_appexp/achievements/presentation/widget/skill_mod.dart';
import 'package:flutter_appexp/dashboard/controller/dashboard_controller.dart';
import 'package:get/get.dart';

import '../../../_core/app_export.dart';

class SectionSkillsTest extends GetView<DashboardController> {
  const SectionSkillsTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listSkill = controller.itemsSkills.value;
    List<Skills> produtosOrdenados = [];
    produtosOrdenados = List.from(listSkill);
    produtosOrdenados.sort((a, b) => b.level.compareTo(a.level));
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: getPadding(
              left: 24,
              top: 27,
              right: 24,
            ),
            child: const CTitle(
              "Suas habilidades",
            ),
          ),
        ),
        controller.itemsSkills.value == []
            ? Container()
            : SizedBox(
                height: 300,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: produtosOrdenados.length = 3,
                    itemBuilder: (context, i) {
                      final contentDetails = controller.itemsSkills.value;
                      return Column(
                        children: [
                          Row(
                            children: [
                              SkillMod(
                                  point: contentDetails[i]!.points.toString(),
                                  level: contentDetails[i]!.level.toString(),
                                  image: contentDetails[i]!.skill.image),
                              SkillBig(
                                  point:
                                      contentDetails.first!.points.toString(),
                                  level: contentDetails.first!.level.toString(),
                                  image: contentDetails.first!.skill.image),
                              SkillMod(
                                  point: contentDetails[i]!.points.toString(),
                                  level: contentDetails[i]!.level.toString(),
                                  image: contentDetails[i]!.skill.image),
                            ],
                          ),
                        ],
                      );
                    }),
              )
      ],
    );
  }
}
