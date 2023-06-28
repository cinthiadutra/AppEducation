import 'package:flutter/material.dart';
import 'package:flutter_appexp/_core/app_export.dart';
import 'package:flutter_appexp/_widgets/common_title.dart';
import 'package:flutter_appexp/dashboard/controller/dashboard_controller.dart';
import 'package:get/get.dart';

class SectionRanking extends GetView<DashboardController> {
  const SectionRanking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var achievement = controller.itemRanking.value;
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: getPadding(
              left: 20,
              top: 20,
              right: 20,
            ),
            child: const CTitle(
              "Ranking",
              sizeText: 24,
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            left: 27,
            top: 24,
            right: 27,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              CommonImageView(
                svgPath: ImageConstant.imgRanking,
                height: getSize(
                  80.00,
                ),
                width: getSize(
                  80.00,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  143.00,
                ),
                margin: getMargin(
                  left: 31,
                  top: 15,
                ),
                child: Column(
                  children: [
                    Text(
                      " ${achievement?.first?.ranking}º - ${(achievement?.first?.name)} (${achievement?.first?.points}) ",
                      style: TextStyle(
                        color: achievement?.first?.userId ==
                                achievement?.user?.userId
                            ? Pallete.purpleA700
                            : Pallete.gray803,
                        fontSize: getFontSize(
                          12,
                        ),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.50,
                        height: 1.33,
                      ),
                    ),
                    Visibility(
                      child: Text(
                        " ${achievement?.aboveUser?.ranking}º - ${achievement?.aboveUser?.name} (${achievement?.aboveUser?.points}) ",
                        style: TextStyle(
                          color: Pallete.gray803,
                          fontSize: getFontSize(
                            12,
                          ),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.50,
                          height: 1.33,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: achievement?.user?.userId !=
                          achievement?.first?.userId,
                      child: Text(
                        "${achievement?.user?.ranking}º - ${achievement?.user?.name} (${achievement?.user?.points})",
                        style: TextStyle(
                          color: Pallete.purpleA700,
                          fontSize: getFontSize(
                            15,
                          ),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.50,
                          height: 1.20,
                        ),
                      ),
                    ),
                    Text(
                      "${achievement?.underUser?.ranking}º - ${achievement?.underUser?.name} (${achievement?.underUser?.points})",
                      style: TextStyle(
                        color: Pallete.gray803,
                        fontSize: getFontSize(
                          12,
                        ),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.50,
                        height: 1.33,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
