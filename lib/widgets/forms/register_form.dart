import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:planyourshape/main.dart';
import 'package:planyourshape/widgets/forms/textform.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';
import '../../models/auth.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../buttons/main_button.dart';
import '../buttons/link_button.dart';
import '../../http/http_handler.dart';
import '../../http/error_messages.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

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
            labelName: "First name",
            controller: firstnameController,
          ),
          const SizedBox(height: 10),
          TextForm(
            labelName: "Last name",
            controller: lastnameController,
          ),
          const SizedBox(height: 10),
          TextForm(
            labelName: "Username",
            controller: usernameController,
          ),
          const SizedBox(height: 10),
          TextForm(
            labelName: "Email",
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 10),
          TextForm(
            labelName: "Password",
            controller: passwordController,
            obscureText: true,
          ),
          const SizedBox(height: 10),
          TextForm(
            labelName: "Confirm your password",
            description: "Enter your password",
            controller: passwordConfirmationController,
            obscureText: true,
            validator: (String? passwordconfirmation) {
              if (passwordController.text.compareTo(passwordconfirmation!) ==
                  0) {
                return null;
              }
              return "Password isn't the same";
            },
          ),
          const SizedBox(height: 10),
          MainButton(
              label: "Register",
              onPressedFunc: onPressedFunc,
              formKey: _formKey),
          LinkedButton(
            label: "I already have an account",
            onPressedFunc: () {
              VRouter.of(context).to('/login');
            },
          ),
        ],
      ),
    );
  }

  void onPressedFunc() async {
    try {
      Map<String, dynamic> tokens = await GetIt.I.get<HttpHandler>().register(
          firstname: firstnameController.text.trim(),
          lastname: lastnameController.text.trim(),
          username: usernameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text);

      final dataBox = Hive.box('data');
      var token = tokens['token'];
      var refreshToken = tokens['refreshToken'];

      if (token == null || refreshToken == null) {
        throw Exception(errorList[5]);
      }
      GetIt.I.get<Auth>().setToken(token);
      GetIt.I.get<Auth>().setRefreshToken(refreshToken);
      await GetIt.I.get<Auth>().save();
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
