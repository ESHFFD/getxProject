import 'dart:developer';

import 'package:dio/dio.dart' as dio_service;
import 'package:dio/dio.dart';

class DioService {
  Dio dio = Dio();
  Future<dynamic> getMethod(String url) async {
    dio.options.headers['content-Type'] = 'application/json';
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'GET'))
        .then((response) {
      log(response.toString());
      return response;
    });
  }

// attention:  if in postman we use formData we have to use it in this method
  Future<dynamic> postMethod(Map<String, dynamic> map, String url) async {
    dio.options.headers['content-Type'] = 'application/json';
    return await dio
        .post(url,
            data: dio_service.FormData.fromMap(map),
            options: Options(responseType: ResponseType.json, method: 'POST'))
        .then((value) {
      log(value.headers.toString());
      log(value.data.toString());
      log(value.statusCode.toString());
      return value;
    });
  }
}
