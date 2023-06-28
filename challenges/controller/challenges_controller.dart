import 'package:flutter_appexp/_core/error_handling/error_handler.dart';
import 'package:flutter_appexp/achievements/domain/skills_model.dart';
import 'package:flutter_appexp/challenges/domain/challenge_get.dart';
import 'package:flutter_appexp/challenges/domain/challenge_model_all.dart';
import 'package:flutter_appexp/challenges/services/challenges_service.dart';
import 'package:flutter_appexp/login/controller/auth_controller.dart';
import 'package:flutter_appexp/login/services/auth_service.dart';
import 'package:get/get.dart';

class ChallengeController extends GetxController {
  final ChallengesService service;
  final Rx<ChallengeGet?> itemChContent = Rx<ChallengeGet?>(null);

  // ignore: non_constant_identifier_names
  String number_challenges = '';
  final Rx<ChallengeModel?> itemChallenge = Rx<ChallengeModel?>(null);
  static ChallengeController get to => Get.find<ChallengeController>();
  final authController =
      Get.put(AuthController(service: Get.find<AuthService>()));
  Rx<List<Skills?>> itemsSkills = Rx<List<Skills?>>([]);

  ChallengeController({
    required this.service,
  });

  Future<void> getChallengeDetailsMinimal() async {
    final request = authController.infoUserLogado!.id!;
    final response = await service.getChallengeMinimal(request);

    response.fold((error) => ErrorHandler.i.manageError(error), (model) {
      number_challenges = model.number_challenges.toString();
    });
  }

  Future<void> getChallenge(String idChallenge) async {
    final userid = authController.infoUserLogado!.id!;
    final response = await service.getChallenge(idChallenge, userid);

    response.fold((error) => ErrorHandler.i.manageError(error), (sucesso) {
      itemChContent.value = sucesso;
    });
  }

  // Metodo para inscrever um desafio no usuario
  Future<void> createUserChallenge(challengeId) async {
    final userId = authController.infoUserLogado!.id!;
    final response = await service.createUserChallenge(userId, challengeId);
    response.fold((error) => ErrorHandler.i.manageError(error), (sucesso) {});
  }
}
