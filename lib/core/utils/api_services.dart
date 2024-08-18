import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio = Dio();

  Future<Map<String, dynamic>> get({required String url}) async {
    var response = await dio.get(url);
    return response.data;
  }
}
