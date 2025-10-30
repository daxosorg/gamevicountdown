import 'package:get/get.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_application_1/app/controllers/countdown_controller.dart';
import 'package:flutter_application_1/app/services/remote_config_service.dart';

class CountdownBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirebaseRemoteConfig.instance);
    Get.lazyPut(() => RemoteConfigService(Get.find()));
    Get.lazyPut(() => CountdownController(Get.find()));
  }
}