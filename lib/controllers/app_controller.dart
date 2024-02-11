import 'dart:async';

import 'package:discipline/controllers/api_controller.dart';
import 'package:discipline/controllers/auth_controller.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class AppController extends GetxController {
  final box = GetStorage();

  late bool firstRun;
  late StreamSubscription<InternetConnectionStatus> listener;

  late ApiController apiController;
  late AuthController authController;

  var isOffline = true.obs;

  @override
  void onInit() async {
    firstRun = box.hasData('first_run');
    if (!firstRun) {
      await box.write('first_run', true);
    }

    listener =
        InternetConnectionChecker().onStatusChange.listen((status) async {
      switch (status) {
        case InternetConnectionStatus.connected:
          print('Data connection is available.');
          isOffline.value = false;
        case InternetConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
          isOffline.value = true;
      }
    });

    apiController = Get.put(ApiController());
    authController = Get.put(AuthController());
    super.onInit();
    FlutterNativeSplash.remove();
  }

  @override
  void dispose() {
    super.dispose();
    listener.cancel();
  }
}