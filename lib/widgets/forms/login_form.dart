import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:planyourshape/main.dart';
import 'package:planyourshape/widgets/forms/textform.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';

import '../buttons/main_button.dart';
import '../buttons/link_button.dart';
import '../../http/http_handler.dart';

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
              label: "Login",
              onPressedFunc: () => GetIt.I.get<HttpHandler>().login(
                  usernameController.text.trim(), passwordController.text),
              formKey: _formKey),
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
}
