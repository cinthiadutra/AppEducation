import 'package:flutter_appexp/_core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appexp/dashboard/controller/dashboard_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ProjectItemSelfAvaluation extends GetView<DashboardController> {
  ProjectItemSelfAvaluation({super.key});
  Rx<bool> examsOk = Rx<bool>(false);

  @override
  Widget build(BuildContext context) {
    var challenge = controller.itemChallenge.value?.subscribed_challenges;
    if (controller.itemChallenge.value?.subscribed_challenges != null) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: challenge?.length,
          itemBuilder: (context, index) {
            return Container(
              margin: getMargin(
                top: 8.0,
                bottom: 8.0,
              ),
              decoration: BoxDecoration(
                color: Pallete.whiteA700,
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    8.00,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Pallete.black90019,
                    spreadRadius: getHorizontalSize(
                      2.00,
                    ),
                    blurRadius: getHorizontalSize(
                      2.00,
                    ),
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    8.00,
                  ),
                ),
                child: Row(
                  children: [
                    Text(challenge![index].challengeInformation.title),
                    Obx(() {
                      return Checkbox(
                          value: examsOk.value,
                          onChanged: (value) {
                            examsOk.value = !examsOk.value;
                          });
                    })
                  ],
                ),
              ),
            );
          });
    } else {
      return Container();
    }
  }
}
