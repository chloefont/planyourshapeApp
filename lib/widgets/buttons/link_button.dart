import 'package:flutter/material.dart';
import 'package:planyourshape/http_handler.dart';

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
        minimumSize: const Size.fromHeight(40),
      ),
      onPressed: onPressedFunc,
      child: Text(label),
    );
  }
}
