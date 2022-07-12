import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import '../models/auth.dart';
import './error_messages.dart';

class HttpHandler {
  late final Dio _dio;

  HttpHandler() {
    var options = BaseOptions(
      baseUrl: 'http://172.19.80.1:3000',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    _dio = Dio(options);
  }

  Future<void> login(String username, String password) async {
    final res = await _dio
        .post("/login", data: {'username': username, 'password': password});
    Map<String, dynamic> jsonStr = res.data;

    final authBox = await Hive.openBox('auth');

    GetIt.I.get<Auth>().setToken(jsonStr['token']);
    GetIt.I.get<Auth>().setRefreshToken(jsonStr['refreshToken']);
    await GetIt.I.get<Auth>().save();

    log((authBox.get('auth') as Auth).token);
    //log(GetIt.I.get<Auth>().getRefreshToken());
  }

  Future<void> register(
      {required String firstname,
      required String lastname,
      required String username,
      required String email,
      required String password}) async {
    final dynamic res;
    try {
      res = await _dio.post("/register",
          data: {
            'firstname': firstname,
            'lastname': lastname,
            'username': username,
            'email': email,
            'password': password
          },
          options: Options());

      if (res.statusCode! < 300 && res.statusCode! >= 200) {
        Map<String, dynamic> jsonStr = res.data;

        log(jsonStr.toString());
      }
    } on DioError catch (e) {
      if (e.response != null) {
        Map<String, dynamic> jsonStr = e.response!.data;
        throw Exception(errorList[jsonStr["error"]["id"] as int]!);
      } else {
        throw Exception("Something went wrong. Please try again.");
      }
    }
  }
}
