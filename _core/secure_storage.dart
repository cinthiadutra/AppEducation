// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageDataSecureController {
// Create storage
  final storage = const FlutterSecureStorage();

  // Read value
  Future<String?> readKey(String key) async {
    String? value;
    try {
      value = await storage.read(key: key);
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }
    return value;
  }

  // Write value
  Future<void> writeKey(String key, String? value) async {
    try {
      await storage.write(key: key, value: value);
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }
  }

  // Read all values
  Future<Map<String, String>> readAllKeys() async {
    Map<String, String> allValues = await storage.readAll();
    return allValues;
  }

  // Delete value
  Future<void> deleteKey(String key) async {
    await storage.delete(key: key);
  }

  // Delete all
  Future<void> deleteAllKeys() async {
    await storage.deleteAll();
  }
}
