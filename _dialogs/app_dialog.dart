// ignore_for_file: unrelated_type_equality_checks, unnecessary_null_comparison

import 'dart:async';
import 'package:flutter_appexp/_widgets/common_button.dart';
import 'package:flutter_appexp/_widgets/common_title.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AppDialog {
  AppDialog._internal();
  static AppDialog get i => AppDialog._internal();

  static bool _alreadyExistsADialogOpen = false;
  static bool _isLoading = false;
  final focusNode = FocusNode();

  Future<void> erro({
    String titulo = 'Aviso',
    required String texto,
    String okBotaoText = 'OK',
    FutureOr<void> Function()? onPressedConfirmar,
    bool isBarrierDismissible = false,
  }) async {
    await Future.delayed(const Duration(milliseconds: 50));
    if (_alreadyExistsADialogOpen) Get.back();

    final response = await AppDialogDisplayer(
      titulo: titulo,
      firstButtonText: okBotaoText,
      secondButtonText: null,
      textoContent: texto,
      onPressedFirstButton: onPressedConfirmar,
      onPressedSecondButton: null,
    )._show(isBarrierDismissible);

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
    bool isBarrierDismissible = false,
  }) async {
    await Future.delayed(const Duration(milliseconds: 50));
    if (_alreadyExistsADialogOpen) Get.back();

    final response = await AppDialogDisplayer(
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

    return response;
  }

  Future<void> oneButton({
    String titulo = 'Aviso',
    required String text,
    String? stamp,
    String okBotaoText = 'Fechar',
    FutureOr<void> Function()? onPressedConfirmar,
    bool isBarrierDismissible = false,
  }) async {
    await Future.delayed(const Duration(milliseconds: 120));
    if (_alreadyExistsADialogOpen) Get.back();
    AppDialog._alreadyExistsADialogOpen = true;
    final response = AppDialogDisplayer(
      titulo: titulo,
      firstButtonText: okBotaoText,
      onPressedFirstButton: onPressedConfirmar,
      textoContent: text,
      secondButtonText: null,
      onPressedSecondButton: null,
    )._show(isBarrierDismissible);

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
    AppDialog._alreadyExistsADialogOpen = true;
    final response = await AppDialogDisplayer(
      wid: 319,
      hei: 132,
      titulo: titulo,
      firstButtonText: okBotaoText,
      onPressedFirstButton: onPressedConfirmar,
      textoContent: pointCount,
      secondButtonText: null,
      onPressedSecondButton: null,
    )._show(isBarrierDismissible);
    AppDialog._alreadyExistsADialogOpen = false;
    focusNode.unfocus();

    closeLoading();
    return response;
  }

  void closeLoading() {
    if (AppDialog._isLoading == true) return;
    AppDialog._isLoading = false;
    focusNode.unfocus();

    Get.back();
  }

  Future<void> showDialogLoading([bool force = false]) async {
    await Future.delayed(const Duration(milliseconds: 50));
    if (_alreadyExistsADialogOpen && force == false) return;
    if (AppDialog._isLoading && force == false) return;

    AppDialog._alreadyExistsADialogOpen = true;
    AppDialog._isLoading = true;
    await Get.dialog<void>(const AppLoadingDialog(), barrierDismissible: false);
    AppDialog._alreadyExistsADialogOpen = false;
    AppDialog._isLoading = false;
    focusNode.unfocus();
  }
}

class AppDialogDisplayer {
  final String titulo;
  final String firstButtonText;
  final String? secondButtonText;
  final double? wid;
  final double? hei;
  final String? imagePop;

  final String textoContent;
  final FutureOr<void> Function()? onPressedFirstButton;
  final FutureOr<void> Function()? onPressedSecondButton;

  AppDialogDisplayer({
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
    final focusNode = FocusNode();
    return await Get.dialog<void>(SizedBox(
        child: AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 25),
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.transparent, width: 3),
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
      ),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        CTitle(
          titulo,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          textoContent,
        ),
      ]),
      actions: <Widget>[
        Center(
          child: CustomButton(
            variant: ButtonVariant.fillPurpleA700,
            width: 100,
            onTap: () async {
              focusNode.unfocus();
              _goback();
              if (onPressedFirstButton != null) {
                await onPressedFirstButton!();
              }
            },
            text: firstButtonText,
          ),
        ),
        if (secondButtonText != null) ...{
          const SizedBox(height: 8),
          CustomButton(
            variant: ButtonVariant.fillBlue,
            onTap: () async {
              _goback();
              focusNode.unfocus();
              if (onPressedSecondButton == null) return;
              await onPressedSecondButton!();
            },
            text: secondButtonText!,
          ),
        },
        const SizedBox(height: 20),
      ],
    )));
  }

  void _goback() {
    Get.back();
    AppDialog._alreadyExistsADialogOpen = false;
  }
}

void setIsDialogOpenToFalse() => AppDialog._alreadyExistsADialogOpen = false;

class AppLoadingDialog extends StatelessWidget {
  const AppLoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AppDialog._alreadyExistsADialogOpen = false;
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
