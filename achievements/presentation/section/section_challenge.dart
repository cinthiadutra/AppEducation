import 'package:flutter/material.dart';
import 'package:flutter_appexp/_core/Routes/app_routes.dart';
import 'package:flutter_appexp/dashboard/controller/dashboard_controller.dart';
import 'package:get/get.dart';

import '../../../_core/app_export.dart';
import '../../../_widgets/widgets_export.dart';

class SectionDesafios extends GetView<DashboardController> {
  const SectionDesafios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var challenge = controller.itemChallenge.value?.subscribed_challenges;
    return Align(
        alignment: Alignment.centerLeft,
        child: Column(children: [
          const SizedBox(
            height: 16,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Pallete.whiteA700,
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        14.00,
                      ),
                    ),
                  ),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: getVerticalSize(
                              7.00,
                            ),
                            width: getHorizontalSize(
                              390.00,
                            ),
                            decoration: BoxDecoration(
                              color: Pallete.whiteA701,
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 24,
                            top: 24,
                            right: 24,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 3,
                                  bottom: 4,
                                ),
                                child: const CTitle(
                                  "Seus desafios",
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.challengesDetails);
                                },
                                child: CommonImageView(
                                  svgPath: ImageConstant.imgArrowright,
                                  height: getSize(
                                    24.00,
                                  ),
                                  width: getSize(
                                    24.00,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 24,
                            top: 24,
                            right: 18,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 17,
                                  bottom: 17,
                                ),
                                child: CommonImageView(
                                  svgPath: ImageConstant.imgDashboard,
                                  height: getSize(
                                    76.00,
                                  ),
                                  width: getSize(
                                    76.00,
                                  ),
                                ),
                              ),
                              challenge?.length == null
                                  ? const Text("Dados Não encontrados")
                                  : SizedBox(
                                      width: 250,
                                      child: Padding(
                                        padding: getPadding(
                                          left: 16,
                                        ),
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: challenge!.length < 3
                                                ? challenge.length
                                                : 3,
                                            itemBuilder: (context, index) {
                                              return Column(children: [
                                                CPercentBar(
                                                  title: challenge[index]
                                                      .challengeInformation
                                                      .title,
                                                  amount: challenge[index]
                                                      .totalContentsCompleted,
                                                  total: challenge[index]
                                                      .totalContents,
                                                  index: index,
                                                ),
                                              ]);
                                            }),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: getVerticalSize(
                              7.00,
                            ),
                            width: getHorizontalSize(
                              390.00,
                            ),
                            margin: getMargin(
                              top: 24,
                            ),
                            decoration: BoxDecoration(
                              color: Pallete.whiteA701,
                            ),
                          ),
                        )
                      ]))),
        ]));
  }
}
