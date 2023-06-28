import 'package:flutter/material.dart';
import 'package:flutter_appexp/_core/constants/pallete.dart';
import 'package:flutter_appexp/_widgets/widgets_export.dart';
import 'package:flutter_appexp/profile/controller/profile_controller.dart';
import 'package:get/get.dart';

class ChangeEmailScreen extends GetView<ProfileController> {
  const ChangeEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Pallete.whiteA701,
          title: Image.asset("assets/Expacer-logo_cor1.png"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 55, left: 25, right: 25),
            child: Column(children: <Widget>[
              const SizedBox(height: 80),
              const Align(
                alignment: Alignment.bottomLeft,
                child: CTitle('Alterar Email'),
              ),
              const SizedBox(height: 24),
              CustomTextFormField(
                  width: 342,
                  controller: controller.newEmail,
                  prefix: const Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  hintText: 'Email'),
              const SizedBox(height: 30),
              const SizedBox(height: 25),
              CustomButton(
                width: 297,
                onTap: () async {
                  await controller.updateEmail();
                },
                text: 'Alterar',
                variant: ButtonVariant.fillPurpleA700,
              ),
              const SizedBox(
                height: 24,
              ),
              CustomButton(
                width: 297,
                onTap: () {
                  Get.back();
                },
                text: 'Voltar',
                variant: ButtonVariant.fillGray400,
              ),
              const SizedBox(height: 50),
            ]),
          ),
        )));
  }
}
