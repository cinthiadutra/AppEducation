// ignore_for_file: unrelated_type_equality_checks, unnecessary_null_comparison

import 'dart:async';
import 'package:flutter_appexp/_core/Routes/app_routes.dart';
import 'package:flutter_appexp/_widgets/common_button.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AppDialogMini {
  const AppDialogMini._internal();
  static AppDialogMini get i => const AppDialogMini._internal();

  static bool _alreadyExistsADialogOpen = false;
  static bool _isLoading = false;

  Future<void> erro({
    String titulo = 'Aviso',
    required String texto,
    String okBotaoText = 'OK',
    FutureOr<void> Function()? onPressedConfirmar,
    bool isBarrierDismissible = true,
  }) async {
    await Future.delayed(const Duration(milliseconds: 50));
    if (_alreadyExistsADialogOpen) Get.back();

    AppDialogMini._alreadyExistsADialogOpen = true;
    final response = await AppDialogMiniDisplayer(
      titulo: titulo,
      firstButtonText: okBotaoText,
      secondButtonText: null,
      textoContent: texto,
      onPressedFirstButton: onPressedConfirmar,
      onPressedSecondButton: null,
    )._show(isBarrierDismissible);
    AppDialogMini._alreadyExistsADialogOpen = false;
    return response;
  }

  Future<void> sucess({
    String image = 'asset/icons/stars.png',
    String titulo = 'Sucesso',
    String text = '',
    String simTexto = 'Compartilhar',
    String naoTexto = 'fechar',
    required FutureOr<void> Function() onPressedConfirmar,
    FutureOr<void> Function()? onPressedCancelar,
    bool isBarrierDismissible = true,
  }) async {
    await Future.delayed(const Duration(milliseconds: 50));
    if (_alreadyExistsADialogOpen) Get.back();

    AppDialogMini._alreadyExistsADialogOpen = true;
    final response = await AppDialogMiniDisplayer(
      wid: 319,
      hei: 320,
      imagePop: image,
      titulo: titulo,
      textoContent: text,
      firstButtonText: simTexto,
      secondButtonText: naoTexto,
      onPressedFirstButton: onPressedConfirmar,
      onPressedSecondButton: onPressedCancelar,
    )._show(isBarrierDismissible);
    AppDialogMini._alreadyExistsADialogOpen = false;
    return response;
  }

  Future<void> oneButton({
    String titulo = 'Aviso',
    required String text,
    String? stamp,
    String okBotaoText = 'Fechar',
    FutureOr<void> Function()? onPressedConfirmar,
    bool isBarrierDismissible = true,
  }) async {
    await Future.delayed(const Duration(milliseconds: 120));
    if (_alreadyExistsADialogOpen) Get.back();

    AppDialogMini._alreadyExistsADialogOpen = true;
    final response = await AppDialogMiniDisplayer(
      titulo: titulo,
      firstButtonText: okBotaoText,
      onPressedFirstButton: onPressedConfirmar,
      textoContent: text,
      secondButtonText: null,
      onPressedSecondButton: null,
    )._show(isBarrierDismissible);
    AppDialogMini._alreadyExistsADialogOpen = false;
    closeLoading();
    return response;
  }

  Future<void> skillAdd({
    String titulo = 'skillName',
    required String pointCount,
    String okBotaoText = 'OK',
    FutureOr<void> Function()? onPressedConfirmar,
    bool isBarrierDismissible = true,
  }) async {
    await Future.delayed(const Duration(milliseconds: 120));
    if (_alreadyExistsADialogOpen) Get.back();
    AppDialogMini._alreadyExistsADialogOpen = true;
    final response = await AppDialogMiniDisplayer(
      wid: 319,
      hei: 132,
      titulo: titulo,
      firstButtonText: okBotaoText,
      onPressedFirstButton: onPressedConfirmar,
      textoContent: pointCount,
      secondButtonText: null,
      onPressedSecondButton: null,
    )._show(isBarrierDismissible);
    AppDialogMini._alreadyExistsADialogOpen = false;
    return response;
  }

  void closeLoading() {
    if (AppDialogMini._isLoading == true) return;
    AppDialogMini._isLoading = false;
    Get.back();
  }

  Future<void> showDialogLoading([bool force = false]) async {
    await Future.delayed(const Duration(milliseconds: 50));
    if (_alreadyExistsADialogOpen && force == false) return;
    if (AppDialogMini._isLoading && force == false) return;

    AppDialogMini._alreadyExistsADialogOpen = true;
    AppDialogMini._isLoading = true;
    await Get.dialog<void>(const AppLoadingDialog(), barrierDismissible: false);
    AppDialogMini._alreadyExistsADialogOpen = false;
    AppDialogMini._isLoading = false;
  }
}

class AppDialogMiniDisplayer {
  final String titulo;
  final String firstButtonText;
  final String? secondButtonText;
  final double? wid;
  final double? hei;
  final String? imagePop;

  final String textoContent;
  final FutureOr<void> Function()? onPressedFirstButton;
  final FutureOr<void> Function()? onPressedSecondButton;

  AppDialogMiniDisplayer({
    this.wid,
    this.hei,
    this.imagePop,
    required this.titulo,
    required this.firstButtonText,
    required this.secondButtonText,
    required this.textoContent,
    required this.onPressedFirstButton,
    required this.onPressedSecondButton,
  });

  Future<void> _show(bool isBarrierDismissible) async {
    return await Get.dialog<void>(
      WillPopScope(
          onWillPop: () async {
            if (precisaDeslogarOUsuario()) return false;
            if (isBarrierDismissible) return false;
            AppDialogMini._alreadyExistsADialogOpen = false;
            return true;
          },
          child: SizedBox(
              width: wid,
              height: hei,
              child: AlertDialog(
                insetPadding: const EdgeInsets.symmetric(horizontal: 25),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                ),
                content: Column(children: [
                  Row(children: [
                    Image.asset(imagePop!),
                    Column(
                      children: [
                        Text(
                          titulo,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          textoContent,
                        ),
                      ],
                    ),
                  ])
                ]),
                actions: <Widget>[
                  if (firstButtonText != null) ...{
                    Center(
                      child: CustomButton(
                        variant: ButtonVariant.fillPurpleA700,
                        width: 60,
                        onTap: () async {
                          if (precisaDeslogarOUsuario()) {
                            _goback();
                            Get.offAllNamed(AppRoutes.login);
                          } else {
                            _goback();
                            if (onPressedFirstButton != null) {
                              await onPressedFirstButton!();
                            }
                          }
                        },
                        text: firstButtonText,
                      ),
                    ),
                  } else if (secondButtonText != null) ...{
                    const SizedBox(height: 8),
                    CustomButton(
                      variant: ButtonVariant.fillBlue,
                      onTap: () async {
                        _goback();
                        if (onPressedSecondButton == null) return;
                        await onPressedSecondButton!();
                      },
                      text: secondButtonText!,
                    ),
                  },
                  const SizedBox(height: 20),
                ],
              ))),
    );
  }

  void _goback() {
    Get.back();
    AppDialogMini._alreadyExistsADialogOpen = false;
  }

  bool noInternetMessage = true;
  bool precisaDeslogarOUsuario() {
    final bool usuarioTomouNaoAutorizado =
        textoContent.trim().toLowerCase().contains('sua sessão expirou');

    final bool usuarioEstaSemInternet =
        noInternetMessage == textoContent.trim();
    const bool usuarioNaoEstaNaTelaDeLogin = true;

    bool haveToDeslogUser =
        (usuarioEstaSemInternet || usuarioTomouNaoAutorizado) &&
            usuarioNaoEstaNaTelaDeLogin;
    return haveToDeslogUser;
  }
}

void setIsDialogOpenToFalse() =>
    AppDialogMini._alreadyExistsADialogOpen = false;

class AppLoadingDialog extends StatelessWidget {
  const AppLoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AppDialogMini._alreadyExistsADialogOpen = false;
        return true;
      },
      child: SimpleDialog(
        backgroundColor: Colors.white,
        children: <Widget>[
          Center(
            child: Column(children: const [
              CircularProgressIndicator(
                color: Colors.purple,
              ),
              SizedBox(height: 10),
              Text(
                "Aguarde....",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19.0,
                  fontWeight: FontWeight.w400,
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
