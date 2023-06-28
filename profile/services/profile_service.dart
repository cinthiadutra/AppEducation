import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_appexp/_core/config/config_app.dart';
import 'package:flutter_appexp/_core/error_handling/http_error.dart';
import 'package:flutter_appexp/login/controller/auth_controller.dart';
import 'package:flutter_appexp/login/domain/response_default.dart';
import 'package:flutter_appexp/login/services/auth_service.dart';
import 'package:flutter_appexp/profile/domain/project_model.dart';
import 'package:flutter_appexp/webclient/custom_dio.dart';
import 'package:get/get.dart';

import '../../login/domain/user_response.dart';

class ProfileService extends GetxService {
  var controller = Get.put(AuthController(service: Get.find<AuthService>()));

  var dio = CustomDio().instance;
  var dioAuth = CustomDio.withAuthentication().instance;
  final kBaseUrl = ConfigApp.BASE_URL;

//pegar dados do usuario logado
  Future<Either<HttpRequestException, DataUser>> getUser(String id) async {
    try {
      var response =
          await dioAuth.get('$kBaseUrl/user/$id');
      final model = UserData.fromMap(response.data);
      return right(model.dataUser);
    } catch (e, s) {
      log('deu erro', error: e, stackTrace: s);
      return left(throw const HttpException('erro'));
    }
  }

  // Future<Either<HttpRequestException, UserModel>> getUserDetails(
  //     String userId) async {
  //   try {
  //     var response =
  //         await dioAuth.get('$kBaseUrl/user/$id', queryParameters: {
  //       "id": id,
  //     });
  //     return right(response.data);
  //   } catch (e, s) {
  //     log('deu erro', error: e, stackTrace: s);
  //     return left(throw const HttpException(
  //         "Não foi possível encontrar detalhes do usuário"));
  //   }
  // }

  Future<Either<HttpRequestException, DataUser>> updateUser(String id) async {
    try {
      var response = await dioAuth.patch('$kBaseUrl/user/:id', data: {});
      final model = UserData.fromMap(response.data).dataUser;
      return right(model);
    } catch (e, s) {
      log('deu erro', error: e, stackTrace: s);
      return left(throw const HttpException('erro'));
    }
  }

  Future<Either<HttpRequestException, DataUser>> getProjectID(
      String idProject) async {
    try {
      var response = await dioAuth.get('$kBaseUrl/project/:id');
      final model = UserData.fromMap(response.data);

      return right(model.dataUser);
    } catch (e, s) {
      log('deu erro', error: e, stackTrace: s);
      return left(throw const HttpException('erro'));
    }
  }

  Future<Either<HttpRequestException, List<Project>>> listProject(
      String id) async {
    try {
      var response = await dioAuth.get('$kBaseUrl/project/user/$id');
      final model = ProjectModel.fromMap(response.data).data;
      return right(model!);
    } catch (e, s) {
      log('deu erro', error: e, stackTrace: s);
      return left(throw const HttpException('erro'));
    }
  }

  Future<Either<HttpRequestException, ResponseDefault>> updateEmail(
      String id, String newEmail) async {
    try {
      var response = await dioAuth.patch('$kBaseUrl/user/email/change/request',
          data: {"user_id": id, "new_email": newEmail});
      final model = ResponseDefault.fromMap(response.data);
      return right(model);
    } catch (e, s) {
      log('deu erro', error: e, stackTrace: s);
      return left(throw const HttpException('erro'));
    }
  }
}
