import 'package:flutter_appexp/_core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appexp/profile/controller/profile_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ProjectItemWidget extends GetView<ProfileController> {
  const ProjectItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: controller.itemsProject.value?.length,
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
                  15.00,
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    getHorizontalSize(
                      8.00,
                    ),
                  ),
                  child: CommonImageView(
                    url: controller.itemsProject.value![index].image,
                    height: getSize(
                      50.00,
                    ),
                    width: getSize(
                      50.00,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 8,
                    top: 8,
                    right: 3,
                    bottom: 8,
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
                              svgPath: ImageConstant.imgFile,
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
                                controller.itemsProject.value![index].title!,
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
                          200.00,
                        ),
                        margin: getMargin(
                          top: 8,
                          right: 10,
                        ),
                        child: Text(
                          controller.itemsProject.value![index].description!,
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
          );
        });
  }
}
