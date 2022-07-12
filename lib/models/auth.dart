import 'dart:io';
import 'package:hive/hive.dart';

part 'auth.g.dart';

@HiveType(typeId: 0)
class Auth extends HiveObject {
  Auth({
    required this.token,
    required this.refreshToken,
  });

  @HiveField(0)
  String token;

  @HiveField(1)
  String refreshToken;

  String getToken() {
    return token;
  }

  String getRefreshToken() {
    return refreshToken;
  }

  void setToken(String token) {
    this.token = token;
    save();
  }

  void setRefreshToken(String refreshToken) {
    this.refreshToken = refreshToken;
    save();
  }
}
