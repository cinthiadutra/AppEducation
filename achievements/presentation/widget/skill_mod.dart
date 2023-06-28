import 'package:flutter/material.dart';

import 'package:flutter_appexp/_core/constants/pallete.dart';
import 'package:flutter_appexp/_core/utils/size_utils.dart';
import 'package:flutter_appexp/_widgets/common_image_view.dart';

class SkillMod extends StatelessWidget {
  final String point;
  final String level;
  final String image;
  const SkillMod({
    Key? key,
    required this.point,
    required this.level, required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
              padding: getPadding(
                top: 17,
                bottom: 17,
              ),
              child: CommonImageView(
                url: image,
                height: getSize(
                  71.00,
                ),
                width: getSize(
                  71.00,
                ),
              ),
            ),
      Align(
        alignment: Alignment.centerLeft,
        child: Container(
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
            level,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
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
      ),
      Container(
          height: getVerticalSize(
            20.00,
          ),
          width: getHorizontalSize(
            67.00,
          ),
          margin: getMargin(
            top: 4,
            bottom: 19,
          ),
          child: Stack(alignment: Alignment.centerLeft, children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: getPadding(
                  left: 10,
                  top: 6,
                  bottom: 6,
                ),
                child: Container(
                  height: getVerticalSize(
                    8.00,
                  ),
                  width: getHorizontalSize(
                    57.00,
                  ),
                  decoration: BoxDecoration(
                    color: Pallete.bluegray50,
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        4.00,
                      ),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        4.00,
                      ),
                    ),
                    child: LinearProgressIndicator(
                      value:
                          (int.parse(point) - (int.parse(level) * 100)) / 100,
                      backgroundColor: Pallete.bluegray50,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Pallete.orange200,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]))
    ]);
  }
}
