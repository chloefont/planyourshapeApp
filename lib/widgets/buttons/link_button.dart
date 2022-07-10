import 'package:flutter/material.dart';
import 'package:planyourshape/http_handler.dart';
import '../../vars/mainvars.dart';

class LinkedButton extends StatelessWidget {
  final String label;
  final void Function()? onPressedFunc;

  const LinkedButton({
    required this.label,
    required this.onPressedFunc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: mainColor,
        minimumSize: const Size.fromHeight(40),
      ),
      onPressed: onPressedFunc,
      child: Text(label),
    );
  }
}
