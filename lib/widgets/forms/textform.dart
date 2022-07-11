import 'package:flutter/material.dart';
import 'package:planyourshape/main.dart';

class TextForm extends StatefulWidget {
  final String labelName;
  final bool obscureText;
  final TextEditingController? controller;

  const TextForm({
    required this.labelName,
    this.controller,
    this.obscureText = false,
    Key? key,
  }) : super(key: key);

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
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
    var enabledBorder = OutlineInputBorder(
      borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary, width: 1.0),
    );
    const focusedBorder =
        OutlineInputBorder(borderSide: BorderSide(color: mainColor));

    return TextFormField(
      focusNode: focusNode,
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelName,
        labelStyle: TextStyle(
            color: focusNode.hasFocus
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).textTheme.bodyText1!.color),
        hintText: 'Enter your ${widget.labelName.toLowerCase()}',
        errorBorder: enabledBorder,
        focusedErrorBorder: focusedBorder,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        focusColor: Theme.of(context).colorScheme.primary,
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
