import 'package:flutter_appexp/_core/app_export.dart';
import 'package:flutter/material.dart';

class ChatmockItemWidget extends StatelessWidget {
  const ChatmockItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
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
              offset: const Offset(
                0,
                2,
              ),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: getPadding(
                top: 8,
                bottom: 8,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    8.00,
                  ),
                ),
                child: CommonImageView(
                  imagePath: ImageConstant.imgImage26,
                  height: getSize(
                    72.00,
                  ),
                  width: getSize(
                    72.00,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                left: 8,
                top: 8,
                bottom: 11,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: getPadding(
                      right: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CommonImageView(
                          imagePath: ImageConstant.imgFonesdeouvido,
                          height: getSize(
                            16.00,
                          ),
                          width: getSize(
                            16.00,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 8,
                            bottom: 2,
                          ),
                          child: Text(
                            "Me leva",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Pallete.bluegray900,
                              fontSize: getFontSize(
                                12,
                              ),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.50,
                              height: 1.00,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: getHorizontalSize(
                      207.00,
                    ),
                    margin: getMargin(
                      top: 8,
                      right: 10,
                    ),
                    child: Text(
                      "Descubra a forma mais eficiente de começar o seu projeto o menor custo ...",
                      maxLines: null,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Pallete.gray803,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
