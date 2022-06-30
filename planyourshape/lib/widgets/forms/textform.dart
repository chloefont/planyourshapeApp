import 'package:flutter/material.dart';
import 'package:planyourshape/main.dart';
import '../../vars/mainvars.dart';

class LoginTextForm extends StatefulWidget {
  final String labelName;
  final bool obscureText;

  const LoginTextForm({
    required this.labelName,
    this.obscureText = false,
    Key? key,
  }) : super(key: key);

  @override
  State<LoginTextForm> createState() => _LoginTextFormState();
}

class _LoginTextFormState extends State<LoginTextForm> {
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    const enabledBorder = OutlineInputBorder(
      borderSide: BorderSide(color: formColor, width: 1.0),
    );
    const focusedBorder =
        OutlineInputBorder(borderSide: BorderSide(color: mainColor));
    return TextFormField(
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: widget.labelName,
        labelStyle: TextStyle(
            color: focusNode.hasFocus
                ? mainColor
                : Theme.of(context).textTheme.bodyText1!.color),
        hintText: 'Enter your ${widget.labelName.toLowerCase()}',
        errorBorder: enabledBorder,
        focusedErrorBorder: focusedBorder,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        focusColor: mainColor,
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      obscureText: widget.obscureText,
    );
  }
}
