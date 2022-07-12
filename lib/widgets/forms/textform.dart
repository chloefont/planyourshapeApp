import 'package:flutter/material.dart';
import 'package:planyourshape/main.dart';

class TextForm extends StatefulWidget {
  final String labelName;
  final String? description;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const TextForm({
    required this.labelName,
    this.description,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
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
    var focusedBorder = OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary));

    return TextFormField(
      focusNode: focusNode,
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelName,
        labelStyle: TextStyle(
            color: focusNode.hasFocus
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).textTheme.bodyText1!.color),
        hintText: widget.description ??
            'Enter your ${widget.labelName.toLowerCase()}',
        errorBorder: enabledBorder,
        focusedErrorBorder: focusedBorder,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        focusColor: Theme.of(context).colorScheme.primary,
      ),
      validator: widget.validator ??
          (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
    );
  }
}
