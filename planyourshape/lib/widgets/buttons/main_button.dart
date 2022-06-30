import 'package:flutter/material.dart';
import '../../vars/mainvars.dart';

class MainButton extends StatelessWidget {
  final String label;

  const MainButton({
    required this.label,
    required GlobalKey<FormState> formKey,
    Key? key,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(40),
          primary: mainColor,
          onPrimary: formBackgroundColor,
          elevation: 0.0,
          side: const BorderSide(color: mainColor)),
      onPressed: () {
        // Validate will return true if the form is valid, or false if
        // the form is invalid.
        if (_formKey.currentState!.validate()) {
          // Process data.
        }
      },
      child: Text(label),
    );
  }
}
