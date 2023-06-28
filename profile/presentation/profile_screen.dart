import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_appexp/_core/Routes/app_routes.dart';
import 'package:flutter_appexp/_core/constants/pallete.dart';
import 'package:flutter_appexp/_core/utils/size_utils.dart';
import 'package:flutter_appexp/_widgets/common_drawer_app.dart';
import 'package:flutter_appexp/_widgets/widgets_export.dart';
import 'package:flutter_appexp/dashboard/controller/dashboard_controller.dart';
import 'package:flutter_appexp/dashboard/service/dashboard_service.dart';
import 'package:flutter_appexp/profile/controller/profile_controller.dart';
import 'package:flutter_appexp/profile/services/profile_service.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final challengeController =
      Get.put(DashboardController(service: Get.find<DashboardService>()));

  final controller =
      Get.put(ProfileController(service: Get.find<ProfileService>()));
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ExpacerAppBar(estaNahome: false, texto: 'Perfil'),
        endDrawer: customDrawer(context),
        backgroundColor: Pallete.whiteA700,
        body: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Align(
                alignment: Alignment.topLeft,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 350,
                        child: Row(
                          children: [
                            Padding(
                              padding: getPadding(
                                left: 20,
                                right: 20,
                              ),
                              child: Center(
                                child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      Obx(
                                        () => Container(
                                          width: 120.0,
                                          height: 120.0,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: CircleAvatar(
                                            radius: 30,
                                            backgroundImage: controller
                                                        .selectedImage.value !=
                                                    null
                                                ? FileImage(controller
                                                    .selectedImage.value!)
                                                : FileImage(File(
                                                    'images/img_image30.png')),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        child: const Icon(Icons.add_a_photo),
                                        onTap: () async {
                                          await controller
                                              .pickImageFromGallery();
                                        },
                                      )
                                    ]),
                              ),
                            ),
                            Column(
                              children: [
                                CTitle(
                                  challengeController
                                          .itemRanking.value?.user?.name
                                          .toString() ??
                                      '',
                                  fontW: FontWeight.w700,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/trofeu.png',
                                      scale: 1.3,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    CTitle(
                                      challengeController
                                              .itemRanking.value?.user?.points
                                              .toString() ??
                                          '',
                                      fontW: FontWeight.w500,
                                      sizeText: 20,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomButton(
                                    height: 30,
                                    shape: ButtonShape.short,
                                    width: 127,
                                    text: 'Editar perfil',
                                    variant: ButtonVariant.fillPurpleA700,
                                    onTap: () async {
                                      await controller.fluxoProfile();
                                      Get.toNamed(AppRoutes.editProfile);
                                    }),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomButton(
                                  prefixWidget: Icon(
                                    Icons.logout,
                                    color: Pallete.whiteA700,
                                    size: 16,
                                  ),
                                  shape: ButtonShape.short,
                                  height: 30,
                                  width: 127,
                                  text: ' Desconectar',
                                  variant: ButtonVariant.fillBlue,
                                  onTap: () => Get.offAllNamed(AppRoutes.login),
                                ),
                                const SizedBox(
                                  height: 30,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const CDivider(),
                      // CBlock(
                      //   title: "Seus projetos",
                      //   content: const ProjectItemWidget(),
                      //   function: () => Get.toNamed(AppRoutes.profile),
                      // ),
                      // const CDivider(),
                      // CBlock(
                      //     title: "Autoavaliações",
                      //     content: ProjectItemSelfAvaluation()),
                    ],
                  ),
                ),
              ))
            ]));
  }
}
