import 'package:flutter_appexp/_widgets/common_drawer_app.dart';
import 'package:flutter_appexp/challenges/controller/challenges_controller.dart';
import 'package:flutter_appexp/challenges/presentation/challenge_screen/challenge_inscribed.dart';
import 'package:flutter_appexp/challenges/presentation/challenge_screen/challenge_screen.dart';
import 'package:flutter_appexp/_widgets/widgets_export.dart';
import 'package:flutter_appexp/_core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appexp/content/controller/content_controller.dart';
import 'package:flutter_appexp/dashboard/controller/dashboard_controller.dart';
import 'package:get/get.dart';

import 'widgets/challenge_item.dart';

class ChallengeListScreen extends GetView<ContentController> {
  const ChallengeListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dashController = Get.find<DashboardController>();
    final controllerChallenge = Get.find<ChallengeController>();
    var challenge = dashController.itemChallenge.value?.subscribed_challenges;
    var challengeAvailable =
        dashController.challengesAvailable.value;
    return Scaffold(
      endDrawer: customDrawer(context),
      appBar: ExpacerAppBar(texto: 'Desafios', estaNahome: false),
      backgroundColor: Pallete.whiteA700,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CBlock(
              title: "Seus desafios",
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: getPadding(
                      bottom: 110,
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
                  SizedBox(
                    width: 250,
                    child: Column(children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: challenge!.length,
                          itemBuilder: (context, index) {
                            return Column(children: [
                              InkWell(
                                child: CPercentBar(
                                  title: challenge[index]
                                      .challengeInformation
                                      .title,
                                  amount:
                                      challenge[index].totalContentsCompleted,
                                  total: challenge[index].totalContents,
                                  
                                  index: index,
                                ),
                                onTap: () =>
                                    Get.to(ChallengeScreen(index: index)),
                              ),
                            ]);
                          })
                    ]),
                  ),
                ],
              ),
            ),
            const CDivider(),
            CBlock(
              title: "Desafios disponíveis",
              content: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: getVerticalSize(202.00),
                  width: getHorizontalSize(578.00),
                  child:
                      challengeAvailable.isEmpty
                          ? const Center(
                              child: CTitle(
                                'Não há desafios disponiveis!',
                                sizeText: 14,
                                color: Colors.black,
                              ),
                            )
                          : ListView.builder(
                              padding: getPadding(left: 10, top: 23),
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: challengeAvailable.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () async {
                                    await controllerChallenge.getChallenge(challengeAvailable[index]!.id ?? '');
                                    Get.to(ChallengeInscribedScreen(index: index ,));
                                  },
                                  child: ChallengeItemWidget(index: index),
                                );
                              },
                            ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
