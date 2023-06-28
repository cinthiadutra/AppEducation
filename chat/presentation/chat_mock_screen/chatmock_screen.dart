import 'package:flutter_appexp/_widgets/widgets_export.dart';
import 'package:flutter_appexp/_core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appexp/dashboard/controller/dashboard_controller.dart';
import 'package:get/get.dart';
import 'widgets/chatmock_item_widget.dart';

class ChatsScreen extends GetView<DashboardController> {
  final TextEditingController textfieldController = TextEditingController();

  ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.whiteA700,
      body: SingleChildScrollView(
        child: CBlock(
          title: "Comunidade",
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: getPadding(
                      left: 7,
                      top: 5,
                      right: 7,
                      bottom: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          15.50,
                        ),
                      ),
                      border: Border.all(
                        color: Pallete.gray100,
                        width: getHorizontalSize(
                          3.00,
                        ),
                      ),
                    ),
                    child: Text(
                      "Conversas",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Pallete.gray400,
                        fontSize: getFontSize(
                          16,
                        ),
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.10,
                        height: 1.00,
                      ),
                    ),
                  ),
                  Container(
                    padding: getPadding(
                      left: 20,
                      top: 5,
                      right: 20,
                      bottom: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Pallete.gray101,
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          15.50,
                        ),
                      ),
                    ),
                    child: Text(
                      "Projetos",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Pallete.purpleA700,
                        fontSize: getFontSize(
                          16,
                        ),
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.10,
                        height: 1.00,
                      ),
                    ),
                  ),
                  Container(
                    padding: getPadding(
                      left: 12,
                      top: 6,
                      right: 12,
                      bottom: 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          15.50,
                        ),
                      ),
                      border: Border.all(
                        color: Pallete.gray100,
                        width: getHorizontalSize(
                          3.00,
                        ),
                      ),
                    ),
                    child: Text(
                      "Membros",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Pallete.gray400,
                        fontSize: getFontSize(
                          16,
                        ),
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.10,
                        height: 1.00,
                      ),
                    ),
                  ),
                ],
              ),
              CustomSearchView(
                width: 335,
                focusNode: FocusNode(),
                controller: textfieldController,
                hintText: "\"Procurar\"",
                margin: getMargin(
                  left: 6,
                  top: 24,
                  right: 7,
                ),
                alignment: Alignment.center,
                prefix: Container(
                  margin: getMargin(
                    left: 14,
                    top: 9,
                    right: 7,
                    bottom: 7,
                  ),
                  child: CommonImageView(
                    svgPath: ImageConstant.imgSearch,
                  ),
                ),
                prefixConstraints: BoxConstraints(
                  minWidth: getSize(
                    24.00,
                  ),
                  minHeight: getSize(
                    24.00,
                  ),
                ),
                suffix: Padding(
                  padding: EdgeInsets.only(
                    right: getHorizontalSize(
                      15.00,
                    ),
                  ),
                  child: IconButton(
                    onPressed: textfieldController.clear,
                    icon: Icon(
                      Icons.clear,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
                suffixConstraints: BoxConstraints(
                  minWidth: getHorizontalSize(
                    24.00,
                  ),
                  minHeight: getVerticalSize(
                    24.00,
                  ),
                ),
              ),
              CustomButton(
                onTap: () {
                  // Get.to(AppRoutes.
                    
                  // ));
                },
                width: 335,
                text: "\"Adicionar novo projeto\"",
                margin: getMargin(
                  left: 6,
                  top: 24,
                  right: 6,
                ),
                alignment: Alignment.center,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: getPadding(
                    left: 10,
                    top: 24,
                    right: 10,
                  ),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return const ChatmockItemWidget();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
