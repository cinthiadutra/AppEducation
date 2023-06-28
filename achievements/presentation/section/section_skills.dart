import 'package:flutter/material.dart';
import 'package:flutter_appexp/_widgets/common_title.dart';
import 'package:flutter_appexp/achievements/domain/skills_model.dart';
import 'package:flutter_appexp/dashboard/controller/dashboard_controller.dart';
import 'package:flutter_appexp/dashboard/service/dashboard_service.dart';
import 'package:get/get.dart';

import '../../../_core/app_export.dart';

class SectionSkills extends StatefulWidget {
  const SectionSkills({Key? key}) : super(key: key);

  @override
  State<SectionSkills> createState() => _SectionSkillsState();
}

class _SectionSkillsState extends State<SectionSkills> {
  final controller = Get.put(DashboardController(service: DashboardService()));

  @override
  void initState() {
    final listSkill = controller.itemsSkills.value;
    var produtosOrdenados = controller.ordenarLista(listSkill);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final listSkill = controller.itemsSkills.value;
    List<Skills> produtosOrdenados = [];

    produtosOrdenados = List.from(listSkill);
    produtosOrdenados.sort((a, b) => b.level.compareTo(a.level));

    return Column(children: [
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
          : Column(children: [
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        controller.itemsSkills.value.sublist(0, 3).length,
                    itemBuilder: (context, i) {
                      return Row(
                        children: [
                          Stack(clipBehavior: Clip.none, children: [
                            Image.network(
                              produtosOrdenados[i].skill.image,
                              scale: i == 0 ? 1.0 : 4.0,
                            ),
                            Positioned(
                              bottom: -20,
                              child: Row(
                                children: [
                                  Container(
                                    margin: getMargin(
                                      right: 10,
                                    ),
                                    padding: getPadding(
                                      left: 6,
                                      top: 2,
                                      right: 6,
                                      bottom: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Pallete.cyan600,
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(
                                          10.00,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      produtosOrdenados[i].level.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Pallete.whiteA700,
                                        fontSize: getFontSize(
                                          12,
                                        ),
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    height: 10,
                                    child: LinearProgressIndicator(
                                      value: (int.parse(controller
                                                  .itemsSkills.value
                                                  .sublist(0, 3)[i]!
                                                  .points
                                                  .toString()) -
                                              (int.parse(controller
                                                      .itemsSkills.value
                                                      .sublist(0, 3)[i]!
                                                      .level
                                                      .toString()) *
                                                  100)) /
                                          100,
                                      backgroundColor: Pallete.bluegray50,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Pallete.orange200,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                          const SizedBox(
                            width: 10,
                          )
                        ],
                      );
                    }),
              ),
              const SizedBox(
                height: 30,
              ),
              controller.itemsSkills.value.sublist(3, 10).isEmpty
                  ? Container()
                  : SizedBox(
                      height: 100,
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: controller.itemsSkills.value
                              .sublist(3, 10)
                              .length,
                          itemBuilder: (context, i) {
                            var listSkillAll =
                                controller.itemsSkills.value.sublist(3, 10);
                            return Row(children: [
                              Stack(clipBehavior: Clip.none, children: [
                                Image.network(
                                  listSkillAll[i]!.skill.image,
                                  scale: 5.0,
                                ),
                                Positioned(
                                  bottom: -5,
                                  left: 25,
                                  child: Container(
                                    padding: getPadding(
                                      left: 6,
                                      top: 2,
                                      right: 6,
                                      bottom: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Pallete.cyan600,
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(
                                          10.00,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      listSkillAll[i]!.level.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Pallete.whiteA700,
                                        fontSize: getFontSize(
                                          12,
                                        ),
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                              const SizedBox(
                                width: 10,
                              )
                            ]);
                          }))
            ])
    ]);
  }
}
