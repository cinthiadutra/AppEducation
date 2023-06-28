import 'package:flutter_appexp/_core/error_handling/error_handler.dart';
import 'package:flutter_appexp/_core/mixins/loader_mixin.dart';
import 'package:flutter_appexp/_core/secure_storage.dart';
import 'package:flutter_appexp/challenges/domain/challenge_model_all.dart';
import 'package:flutter_appexp/challenges/domain/challenge_model_available.dart';

import 'package:flutter_appexp/challenges/domain/model_coments.dart';
import 'package:flutter_appexp/content/domain/content_challenge_model.dart';
import 'package:flutter_appexp/content/domain/content_model.dart';
import 'package:flutter_appexp/content/domain/content_model_api.dart';
import 'package:flutter_appexp/content/domain/user_content.dart';
import 'package:flutter_appexp/dashboard/controller/dashboard_controller.dart';
import 'package:flutter_appexp/dashboard/service/dashboard_service.dart';
import 'package:get/get.dart';

import 'package:flutter_appexp/content/services/content_service.dart';

class ContentController extends GetxController with LoaderMixin {
  final ContentService service;
  ContentController({
    required this.service,
  });
  final dashController =
      Get.put(DashboardController(service: Get.find<DashboardService>()));
  final Rx<List<ContentDetail?>> itemContent = Rx<List<ContentDetail?>>([]);
  final Rx<List<DatumById?>> itemContentId = Rx<List<DatumById?>>([]);
  final Rx<List<Contents?>> itemContentChallenge = Rx<List<Contents?>>([]);
  final Rx<List<SkillChallengeInformation?>> itemContentChallengeInfo =
      Rx<List<SkillChallengeInformation?>>([]);
  final Rx<ChallengeAvailable?> challengesAvailable =
      Rx<ChallengeAvailable?>(null);
  final Rx<ChallengeModel?> itemChallenge = Rx<ChallengeModel?>(null);
  Rx<ContentDetail?> content = Rx<ContentDetail?>(null);
  final Rx<List<CommentsByEntity?>> itemContentComents =
      Rx<List<CommentsByEntity?>>([]);
  //Variaveis para receber dados por meio do ID de cada conteudo (dsescontinuado)
  List itemContentUserByIdTitle = [];
  List itemContentUserByIdDescription = [];
  final loading = false.obs;
  static ContentController get to => Get.find<ContentController>();
  @override
  void onInit() {
    loaderListener(loading);

    super.onInit();
  }

  Future<void> sendContentCompleted(String contentId) async {
    loading.toggle();
    StorageDataSecureController storage = StorageDataSecureController();
    final idUser = await storage.readKey('id_user');
    final request = UserContent(idUser, contentId);
    final response =
        await service.sendContentCompleted(request.userId!, request.contentId!);
    response.fold((error) => ErrorHandler.i.manageError(error), (model) async {
      itemChallenge.refresh();
      itemContent.refresh();
      itemContentChallenge.refresh();
      loading.toggle();
      refresh();

      Get.back();
    });
  }

  Future<void> getContentFromChallenge(idChallenge) async {
    loading.toggle();
    StorageDataSecureController storage = StorageDataSecureController();
    final idUser = await storage.readKey('id_user');
    final response =
        await service.getContentFromChallenge(idChallenge, idUser!);

    response.fold((error) => ErrorHandler.i.manageError(error), (sucesso) {
      loading.toggle();
      itemContentChallenge.value.assignAll(sucesso);
    });
  }

  Future<void> getContentId(idContent) async {
    loading.toggle();
    final response = await service.getContentId(idContent);

    response.fold((error) => ErrorHandler.i.manageError(error), (sucesso) {
      loading.toggle();
      itemContentId.value.assignAll(sucesso);
    });
  }

  // Método que trás skillsInformation(endpoint: List Contents From Challenge) para página de desafios
  Future<void> getContentFromChallengeInfo(idChallenge) async {
    loading.toggle();
    final responseInfo =
        await service.getContentFromChallengeSkillInfo(idChallenge);
    responseInfo.fold((error) => ErrorHandler.i.manageError(error), (sucesso) {
      loading.toggle();
      itemContentChallengeInfo.value.assignAll(sucesso);
    });
  }

  // Método que trás os comentarios dos usuarios com relção ao conteudo
  Future<void> getListCommentsByEntity(String id) async {
    loading.toggle();
    final response = await service.getListCommentsByEntity(id);

    response.fold((error) => ErrorHandler.i.manageError(error), (model) {
      loading.toggle();
      itemContentComents.value = model;
    });
  }

  //Metodo que envia os comentarios
  Future<void> postSendComment(String entityAnchorId, String message) async {
    StorageDataSecureController storage = StorageDataSecureController();
    final idUser = await storage.readKey('id_user');
    String entityAnchorType = "CONTENT";
    final response = await service.postSendComment(
        entityAnchorId, entityAnchorType, idUser!, message);

    response.fold((error) => ErrorHandler.i.manageError(error), (model) {
      getListCommentsByEntity(entityAnchorId);
    });
  }

  // Future<void> increaseSkill(String skillId, int points) async {
  //   StorageDataSecureController storage = StorageDataSecureController();
  //   final idUser = await storage.readKey('id_user');
  //   final request =
  //       IncreaseModelRequest(userId: idUser!, skillId: skillId, points: points);
  //   final response = await service.skillIncrease(
  //       request.userId, request.skillId, request.points);

  //   response.fold((error) => ErrorHandler.i.manageError(error), (model) {
  //     update();
  //   });
  // }

  // Future<void> fazerFluxoContent() async {
  //   await getChallengeAvailable();
  // }
}
