import 'package:discipline/controllers/api_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final box = GetStorage();

  final ApiController apiController = Get.find();

  late bool hasAuthCredentails;
  var isAuthenticated = false;

  Future<bool> login(Map<String, String> user) async {
    var res = await apiController.post('/token', user);

    return res.statusCode == 200;
  }

  @override
  void onInit() async {
    hasAuthCredentails = box.hasData('has_auth_creds');
    if (hasAuthCredentails) {
      isAuthenticated = await login(box.read('auth_creds')!);
    }

    super.onInit();
  }
}