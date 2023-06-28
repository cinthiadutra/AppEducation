// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_appexp/_core/config/config_app.dart';
import 'package:flutter_appexp/_core/secure_storage.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';

class CustomDio {
  var _dio;

  CustomDio() {
    _dio = Dio();

    _dio.interceptors.add(
      PrettyDioLogger(
          requestHeader: true,
          queryParameters: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
          showProcessingTime: true,
          showCUrl: true,
          canShowLog: true
          // canShowLog: kDebugMode,
          ),
    );
  }
  CustomDio.withAuthentication() {
    _dio = Dio();
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: _onRequest, onResponse: _onResponse, onError: _onError));
    _dio.interceptors.add(
      PrettyDioLogger(
          requestHeader: true,
          queryParameters: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
          showProcessingTime: true,
          showCUrl: true,
          canShowLog: true),
    );
  }
  Dio get instance => _dio;
  final kBaseUrl = ConfigApp.BASE_URL;
  _onRequest(RequestOptions request, RequestInterceptorHandler handler) async {
    StorageDataSecureController storage = StorageDataSecureController();

    var token = await storage.readKey('token');
    if (token != null && token != '') {
      request.headers['Authorization'] = 'Bearer $token';
      request.headers['token'] = "Bearer $token";
      request.baseUrl = kBaseUrl;
      request.connectTimeout = 12000;
      request.receiveTimeout = 12000;
    }
    return handler.next(request);
  }

  _onResponse(response, ResponseInterceptorHandler handler) {
    print(response.data);
    return handler.next(response);
  }

  _onError(e, handler) async {
    if (e.response?.statusCode == 401) {
      StorageDataSecureController storage = StorageDataSecureController();
      var refreshToken = await storage.readKey('refreshToken');
      try {
        await _dio
            .post("$kBaseUrl/refresh-token",
                data: jsonEncode({"refreshToken": refreshToken}))
            .then((value) async {
          if (value?.statusCode == 201) {
            e.requestOptions.headers["Authorization"] =
                "Bearer ${refreshToken!}";
            //create request with new access token
            final opts = Options(
                method: e.requestOptions.method,
                headers: e.requestOptions.headers);
            final cloneReq = await _dio.request(e.requestOptions.path,
                options: opts,
                data: e.requestOptions.data,
                queryParameters: e.requestOptions.queryParameters);

            return handler.resolve(cloneReq);
          }
          return e;
        });
        return _dio;
      } catch (e, s) {
        return log('Erro não esperado', error: e, stackTrace: s);
      }
    }
  }
}
