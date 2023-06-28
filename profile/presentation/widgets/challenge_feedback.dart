import 'package:flutter_appexp/_core/app_export.dart';
import 'package:flutter_appexp/_widgets/common_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appexp/_widgets/widgets_export.dart';
import 'package:flutter_appexp/dashboard/controller/dashboard_controller.dart';
import 'package:get/get.dart';

class FeedbackItemWidget extends StatefulWidget {
  final int index;
  const FeedbackItemWidget({super.key, required this.index});

  @override
  State<FeedbackItemWidget> createState() => _FeedbackItemWidgetState();
}

class _FeedbackItemWidgetState extends State<FeedbackItemWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();
    var challengeAvailable =
        controller.challengesAvailable.value;
    return IntrinsicWidth(
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          height: getVerticalSize(
            230.00,
          ),
          width: getHorizontalSize(
            182.00,
          ),
          margin: getMargin(
            right: 16,
            bottom: 1,
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  margin: getMargin(
                    top: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Pallete.whiteA700,
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        24.00,
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
                        offset: const Offset(
                          0,
                          1,
                        ),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: getHorizontalSize(
                          151.00,
                        ),
                        margin: getMargin(
                          left: 16,
                          top: 22,
                          right: 14,
                        ),
                        child: Text(
                          challengeAvailable[widget.index]!.title ??
                              '',
                          maxLines: null,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Pallete.bluegray700,
                            fontSize: getFontSize(
                              14,
                            ),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.10,
                            height: 1.43,
                          ),
                        ),
                      ),
                      Container(
                        width: getHorizontalSize(
                          138.00,
                        ),
                        margin: getMargin(
                          left: 16,
                          top: 8,
                          right: 16,
                        ),
                        child: Text(
                          "Descubra a forma mais eficiente de começar o seu projeto...",
                          maxLines: null,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Pallete.gray800,
                            fontSize: getFontSize(
                              12,
                            ),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.40,
                            height: 1.33,
                          ),
                        ),
                      ),
                      CustomButton(
                        width: 148,
                        text: "\"Visualizar\"",
                        margin: getMargin(
                          left: 16,
                          top: 13,
                          right: 16,
                          bottom: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomIconButton(
                height: 35,
                width: 35,
                margin: getMargin(
                  left: 72,
                  right: 72,
                  bottom: 10,
                ),
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    Image.asset('assets/icons/Ellipse 5.png'),
                    Image.asset('assets/icons/thumb_up.png')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
