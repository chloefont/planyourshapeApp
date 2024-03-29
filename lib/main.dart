import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:planyourshape/screens/home.dart';
import 'package:planyourshape/screens/register.dart';
import 'package:planyourshape/theme/custom_theme.dart';
import 'package:vrouter/vrouter.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import './models/auth.dart';

import 'screens/login.dart';
import 'http/http_handler.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await setup();
  runApp(const MyApp());
}

Future<void> setup() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AuthAdapter());

  final dataBox = await Hive.openBox('data');

  GetIt.I
    ..registerSingleton(HttpHandler())
    ..registerSingleton<Auth>(
        dataBox.get('auth', defaultValue: Auth(token: "", refreshToken: "")));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return VRouter(
      debugShowCheckedModeBanner: false,
      initialUrl: '/login',
      theme: CustomTheme.lightTheme,
      routes: [
        VWidget(path: '/login', widget: const Login()),
        VWidget(path: '/register', widget: const Register()),
        VWidget(path: '/home', widget: const Home())
      ],
      builder: (BuildContext ctx, Widget child) {
        return Scaffold(
          body: child,
          resizeToAvoidBottomInset: false,
        );
      },
    );
  }
}
