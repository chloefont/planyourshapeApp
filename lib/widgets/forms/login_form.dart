import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:planyourshape/main.dart';
import 'dart:developer';
import 'package:planyourshape/widgets/forms/textform.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';
import '../../models/auth.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../buttons/main_button.dart';
import '../buttons/link_button.dart';
import '../../http/http_handler.dart';
import '../../http/error_messages.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextForm(
            labelName: "Username",
            controller: usernameController,
          ),
          const SizedBox(height: 10),
          TextForm(
            labelName: "Password",
            obscureText: true,
            controller: passwordController,
          ),
          const SizedBox(height: 10),
          MainButton(
              label: "Login", onPressedFunc: onPressedFunc, formKey: _formKey),
          LinkedButton(
            label: "Register",
            onPressedFunc: () {
              VRouter.of(context).to('/register');
            },
          ),
        ],
      ),
    );
  }

  Future<void> onPressedFunc() async {
    try {
      Map<String, dynamic> tokens = await GetIt.I
          .get<HttpHandler>()
          .login(usernameController.text.trim(), passwordController.text);

      final dataBox = Hive.box('data');
      var token = tokens['token'];
      var refreshToken = tokens['refreshToken'];

      if (token == null || refreshToken == null) {
        throw Exception(errorList[5]);
      }
      GetIt.I.get<Auth>().setToken(token);
      GetIt.I.get<Auth>().setRefreshToken(refreshToken);
      await GetIt.I.get<Auth>().save();

      VRouter.of(context).to('/home');
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
