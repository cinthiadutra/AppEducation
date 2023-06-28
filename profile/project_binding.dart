import 'package:flutter_appexp/profile/controller/profile_controller.dart';
import 'package:flutter_appexp/profile/services/profile_service.dart';
import 'package:flutter_appexp/register/controller/register_controller.dart';
import 'package:flutter_appexp/register/services/register_service.dart';
import 'package:get/get.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
       Get.put(ProfileController(service: ProfileService()));
    Get.put<ProfileService>(ProfileService());
      Get.put(RegisterController(service: RegisterService()));
    Get.put<RegisterService>(RegisterService());
  }
}