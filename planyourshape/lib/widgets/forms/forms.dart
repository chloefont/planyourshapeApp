import 'package:flutter/material.dart';
import 'package:planyourshape/widgets/forms/textform.dart';
import '../buttons/mainbutton.dart';

class LineForm extends StatefulWidget {
  const LineForm({Key? key}) : super(key: key);

  @override
  State<LineForm> createState() => LineFormState();
}

class LineFormState extends State<LineForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const LoginTextForm(
            labelName: "Username",
          ),
          const SizedBox(height: 10),
          const LoginTextForm(
            labelName: "Password",
            obscureText: true,
          ),
          const SizedBox(height: 10),
          Container(
              alignment: Alignment.center,
              child: MainButton(label: "Se connecter", formKey: _formKey)),
        ],
      ),
    );
  }
}
