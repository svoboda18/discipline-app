import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart';

class ApiController extends GetxController {
  final box = GetStorage();
  final dio = Dio();

  final apiUrl = '127.0.0.1:8000';

  String? token;

  Future<dynamic> post(String route, Map<String, String> data) async {
    try {
      var res = await dio.post(route, data: data);
      return res.data;
    } catch (e, s) {
      print(e);
      print(s);

      return null;
    }
  }

  @override
  void onInit() async {
    token = box.read('auth_token');

    dio.options.baseUrl = apiUrl;
    dio.options.headers.putIfAbsent('Authrization', () => 'Bearer $token');

    super.onInit();
  }
}