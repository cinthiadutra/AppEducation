import 'package:flutter/material.dart';
import '../_core/app_export.dart';
import 'common_divider.dart';
import 'common_icon_button.dart';
import 'common_title.dart';

class CBlock extends StatelessWidget {
  final String? title;
  final Widget content;
  final Function? function;
  final bool checkIcon;
  final double? size;

  const CBlock(
      {super.key,
      this.title,
      required this.content,
      this.function,
      this.checkIcon = false,
      this.size = 24});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (title != null)
                  ? (function != null)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            (checkIcon)
                                ? Row(
                                    children: [
                                      Flexible(
                                        child: Wrap(children: [
                                          CTitle(
                                            title!,
                                            sizeText: size!,
                                          ),
                                        ]),
                                      ),
                                      CustomIconButton(
                                        height: 21,
                                        width: 21,
                                        margin: getMargin(
                                          left: 12,
                                          top: 2,
                                          bottom: 1,
                                        ),
                                        child: CommonImageView(
                                          svgPath: ImageConstant.imgCheckmark,
                                        ),
                                      ),
                                    ],
                                  )
                                : Expanded(
                                    child: CTitle(
                                      title!,
                                      sizeText: size!,
                                    ),
                                  ),
                            IconButton(
                              onPressed: () {
                                function!();
                              },
                              icon: const Icon(Icons.navigate_next),
                            )
                          ],
                        )
                      : (checkIcon)
                          ? Row(
                              children: [
                                Flexible(
                                  child: Wrap(children: [
                                    CTitle(
                                      title!,
                                      sizeText: size!,
                                    ),
                                  ]),
                                ),
                                CustomIconButton(
                                  height: 21,
                                  width: 21,
                                  margin: getMargin(
                                    left: 12,
                                    top: 2,
                                    bottom: 1,
                                  ),
                                  child: CommonImageView(
                                    svgPath: ImageConstant.imgCheckmark,
                                  ),
                                ),
                              ],
                            )
                          : CTitle(title!)
                  : Container(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: content,
              )
            ],
          ),
        ),
        const CDivider(),
      ],
    );
  }
}
