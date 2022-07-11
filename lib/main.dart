import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:planyourshape/screens/register.dart';
import 'package:planyourshape/theme/custom_theme.dart';
import 'package:vrouter/vrouter.dart';

import './test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'screens/login.dart';
import 'http_handler.dart';

Future<void> main() async {
  setup();
  await dotenv.load(fileName: ".env");
  dire(phrase: dotenv.env['FOO'] as String);
  runApp(const MyApp());
}

void setup() {
  GetIt.I.registerSingleton(HttpHandler());
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
        VWidget(path: '/register', widget: const Register())
      ],
      builder: (BuildContext ctx, Widget child) {
        return Material(child: child);
      },
    );
  }
}
