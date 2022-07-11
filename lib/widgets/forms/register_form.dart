import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:planyourshape/main.dart';
import 'package:planyourshape/widgets/forms/textform.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';

import '../buttons/main_button.dart';
import '../buttons/link_button.dart';
import '../../http_handler.dart';

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
          ),
          const SizedBox(height: 10),
          MainButton(
              label: "Register",
              onPressedFunc: () => GetIt.I
                  .get<HttpHandler>()
                  .login(usernameController.text, passwordController.text),
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
}
