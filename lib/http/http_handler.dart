import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import './error_messages.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpHandler {
  late final Dio _dio;

  HttpHandler() {
    var options = BaseOptions(
      baseUrl: dotenv.env['BACKEND_IP'] as String,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    _dio = Dio(options);
  }

  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final res = await _dio
          .post("/login", data: {'username': username, 'password': password});
      return res.data;
    } on DioError catch (e) {
      if (e.response != null) {
        Map<String, dynamic> jsonStr = e.response!.data;
        throw Exception(errorList[jsonStr["error"]["id"] as int]!);
      } else {
        throw Exception(errorList[5]);
      }
    }
  }

  Future<Map<String, dynamic>> register(
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

      return res.data;
    } on DioError catch (e) {
      if (e.response != null) {
        Map<String, dynamic> jsonStr = e.response!.data;
        throw Exception(errorList[jsonStr["error"]["id"] as int]!);
      } else {
        throw Exception(errorList[5]);
      }
    }
  }
}
