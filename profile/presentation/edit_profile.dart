// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_appexp/_core/Routes/app_routes.dart';

import 'package:flutter_appexp/_core/constants/pallete.dart';
import 'package:flutter_appexp/_core/utils/size_utils.dart';
import 'package:flutter_appexp/_widgets/common_drop_down_pais.dart';
import 'package:flutter_appexp/_widgets/common_drop_down_serie.dart';
import 'package:flutter_appexp/_widgets/common_drop_down_state.dart';
import 'package:flutter_appexp/_widgets/widgets_export.dart';
import 'package:flutter_appexp/profile/controller/profile_controller.dart';
import 'package:flutter_appexp/profile/services/profile_service.dart';
import 'package:flutter_appexp/register/controller/register_controller.dart';
import 'package:flutter_appexp/register/services/register_service.dart';
import 'package:get/get.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final formKey = GlobalKey<FormState>();

  final controller =
      Get.put(ProfileController(service: Get.find<ProfileService>()));

  final registerController =
      Get.put(RegisterController(service: Get.find<RegisterService>()));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ExpacerAppBar(texto: "Perfil", estaNahome: true),
        backgroundColor: Pallete.whiteA700,
        body: FutureBuilder(
            future: registerController.fluxoRegister(),
            builder: (context, snap) {
              switch (snap.connectionState) {
                case ConnectionState.none:
                  return Container();
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                case ConnectionState.done:
                  return Container(
                      width: size.width,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(height: 32),
                              const CTitle("Informações pessoais"),
                              CustomTextFormField(
                                initialValue: controller.dadosUser.value?.name,
                                width: 342,
                                focusNode: FocusNode(),
                                hintText: "Nome",
                                margin: getMargin(top: 20),
                                alignment: Alignment.center,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Preencha o campo';
                                  }
                                  return null;
                                },
                              ),
                              CustomTextFormField(
                                initialValue:
                                    controller.dadosUser.value?.lastName,
                                width: 342,
                                focusNode: FocusNode(),
                                hintText: "Sobrenome*",
                                margin: getMargin(
                                  top: 16,
                                ),
                                alignment: Alignment.center,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Preencha o campo';
                                  }
                                  return null;
                                },
                              ),
                              CustomTextFormField(
                                initialValue:
                                    controller.dadosUser.value?.preferenceName,
                                width: 342,
                                focusNode: FocusNode(),
                                hintText: "Apelido",
                                margin: getMargin(
                                  top: 16,
                                ),
                                alignment: Alignment.center,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Preencha o campo';
                                  }
                                  return null;
                                },
                              ),
                              CustomTextFormField(
                                initialValue:
                                    controller.dadosUser.value?.emailAddress,
                                width: 342,
                                focusNode: FocusNode(),
                                hintText: "Email",
                                margin: getMargin(
                                  top: 16,
                                ),
                                alignment: Alignment.center,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Preencha o campo';
                                  }
                                  return null;
                                },
                              ),
                              Obx(() {
                                var lista = controller.serieSelecionadas.value;
                                var serie =
                                    controller.dadosUser.value?.schoolGrade;
                                return CustomDropDownSerie(
                                  hintText: serie,
                                  items: lista,
                                  onChanged: (String newValue) {
                                    controller.newSerieSelecionada = newValue;
                                  },
                                  // hintText: serie?.name,
                                  width: 342,
                                  focusNode: FocusNode(),
                                  // hintText:
                                  //     controller.dadosUser.value?.schoolGrade,
                                  margin: getMargin(
                                    top: 16,
                                  ),
                                  alignment: Alignment.center,
                                );
                              }),
                              Obx(() {
                                var listaPais = controller.itemsPais.value;
                                return CustomDropDownPais(
                                    width: 360,
                                    focusNode: FocusNode(),
                                    hintText: controller
                                        .dadosUser.value?.address?.country,
                                    margin: getMargin(
                                      top: 16,
                                    ),
                                    alignment: Alignment.center,
                                    items: listaPais,
                                    onSaved: (String newValue) async {
                                      controller.newPaisSelecionado = newValue;
                                      controller.newPaisSelecionado.obs;

                                      await registerController.listStates();
                                    });
                              }),
                              Obx(() {
                                return CustomDropDownState(
                                  width: 360,
                                  focusNode: FocusNode(),
                                  hintText: controller
                                      .dadosUser.value?.address?.state,
                                  margin: getMargin(
                                    top: 16,
                                  ),
                                  alignment: Alignment.center,
                                  items: controller.itemsState.value.obs,
                                  onChanged: (String newValue) async {
                                    controller.newEstadoSelecionado = newValue;
                                    await registerController.listCity();
                                  },
                                );
                              }),
                              Obx(() {
                                var listCity = controller.itemsCity.value;
                                return CustomDropDown(
                                  width: 360,
                                  focusNode: FocusNode(),
                                  hintText:
                                      controller.dadosUser.value?.address?.city,
                                  margin: getMargin(
                                    top: 16,
                                  ),
                                  alignment: Alignment.center,
                                  items: listCity,
                                  onChanged: (String newValue) async {
                                    controller.newCidadeSelecionado = newValue;
                                  },
                                );
                              }),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Get.toNamed(
                                            AppRoutes.changeEmailScreen);
                                      },
                                      child: const CTitleLocal(
                                        'Trocar email',
                                        size: 16,
                                      )),
                                  const SizedBox(
                                    width: 20,
                                    child: CTitleLocal(' - '),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Get.toNamed(AppRoutes.recovery);
                                      },
                                      child: const CTitleLocal(
                                        'Trocar senha',
                                        size: 16,
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomButton(
                                shape: ButtonShape.short,
                                onTap: () async {
                                  if (formKey.currentState!.validate()) {
                                    controller.updateUser();
                                  }
                                },
                                text: "Concluir",
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomButton(
                                shape: ButtonShape.short,
                                onTap: () {
                                  Get.back();
                                },
                                variant: ButtonVariant.fillBlue,
                                text: "Voltar",
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),
                      ));
              }
            }),
      ),
    );
  }
}
