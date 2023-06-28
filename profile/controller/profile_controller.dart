import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_appexp/_core/error_handling/error_handler.dart';
import 'package:flutter_appexp/_core/mixins/loader_mixin.dart';
import 'package:flutter_appexp/_core/secure_storage.dart';

import 'package:flutter_appexp/login/domain/user_response.dart';
import 'package:flutter_appexp/profile/domain/change_email_model.dart';
import 'package:flutter_appexp/profile/domain/project_model.dart';
import 'package:flutter_appexp/register/controller/register_controller.dart';
import 'package:flutter_appexp/register/domain/country.dart';
import 'package:flutter_appexp/register/domain/school_grade_model.dart';
import 'package:flutter_appexp/register/domain/states.dart';
import 'package:flutter_appexp/register/services/register_service.dart';
import 'package:get/get.dart';

import 'package:flutter_appexp/profile/services/profile_service.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController with LoaderMixin {
  ProfileService service;
  ProfileController({
    required this.service,
  });
  final loading = false.obs;

  static ProfileController get to => Get.find<ProfileController>();

  var registerController =
      Get.put(RegisterController(service: Get.put(RegisterService())));
  Rx<DataUser?> dadosUser = Rx<DataUser?>(null);
  Rx<List<Project>?> itemsProject = Rx<List<Project>?>([]);
  Project? projeto;
  File? image;
  File? imagePath = File('/assets/images/img_image30.png');
  TextEditingController newEmail = TextEditingController();
  TextEditingController newName = TextEditingController();
  TextEditingController newLastName = TextEditingController();
  TextEditingController newPreferenceName = TextEditingController();
  TextEditingController newEmailAddress = TextEditingController();

  TextEditingController deviceId = TextEditingController();
  // TextEditingController newCity = TextEditingController();
  // TextEditingController state = TextEditingController();
  // TextEditingController country = TextEditingController();
  // TextEditingController schoolGrade = TextEditingController();

  Rx<List<Grade>> get serieSelecionadas => registerController.serieSelecionadas;
  Rx<List<Country>> get itemsPais => registerController.itemsPais;

  Rx<List<States>> get itemsState => registerController.itemsState;
  Rx<List<String>> get itemsCity => registerController.itemsCities;

  String newSerieSelecionada = '';
  String newEstadoSelecionado = '';
  String newCidadeSelecionado = '';
  String newPaisSelecionado = '';

  Rx<File?> selectedImage = Rx(null);
  @override
  void onInit() async {
    loaderListener(loading);
    super.onInit();
  }

  Future<void> getUser() async {
    StorageDataSecureController storage = StorageDataSecureController();
    final request = await storage.readKey('id_user');
    loading.toggle();
    final response = await service.getUser(request!);

    response.fold((error) => ErrorHandler.i.manageError(error), (sucesso) {
      loading.toggle();
      dadosUser.value = sucesso;
      update();
      log(dadosUser.toString());
    });
  }

  Future<void> getProjectID() async {
    loading.toggle();
    final request = projeto?.id;

    final response = await service.getUser(request!);

    response.fold((error) => ErrorHandler.i.manageError(error), (sucesso) {
      loading.toggle();
      dadosUser.value = sucesso;
      update();
    });
  }

  Future<void> listProject() async {
    loading.toggle();
    StorageDataSecureController storage = StorageDataSecureController();
    final request = await storage.readKey('id_user');
    final response = await service.listProject(request!);

    response.fold((error) => ErrorHandler.i.manageError(error), (sucesso) {
      loading.toggle();
      itemsProject.value?.addAll(sucesso);
    });
  }

  Future<void> pickImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }

  Future<void> updateEmail() async {
    loading.toggle();
    StorageDataSecureController storage = StorageDataSecureController();
    final id = await storage.readKey('id_user');
    final request = ChangeEmailModel(id: id!, newEmail: newEmail.text);
    final response = await service.updateEmail(request.id, request.newEmail);

    response.fold((error) => ErrorHandler.i.manageError(error), (sucess) {
      loading.toggle();
      // ChangeEmailAssign(token: sucess.data, userId: userId, actualEmail: actualEmail, newEmail: newEmail)
      dadosUser.value!.emailAddress == newEmail.text;
      update();
    });
  }

  Future<void> updateUser() async {}

  fluxoProfile() async {
    await getUser();
    await registerController.listSerie();
    await registerController.listCountries();
  }
}
