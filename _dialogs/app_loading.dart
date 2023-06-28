
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Load {
  //TODO: Testando loading quando clicar em botões de mudança de tela
  void loaderListener(RxBool loading) {
    ever(loading, (_) async {
      if (loading.isTrue) {
        await Get.dialog(
            WillPopScope(
              onWillPop: () async => false,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            barrierDismissible: false);
      } else {
        Get.back();
      }
    });
  }

}