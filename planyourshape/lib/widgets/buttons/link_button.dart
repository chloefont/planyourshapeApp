import 'package:flutter/material.dart';
import '../../vars/mainvars.dart';

class LinkedButton extends StatelessWidget {
  final String label;

  const LinkedButton({
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: mainColor,
        minimumSize: const Size.fromHeight(40),
      ),
      onPressed: () {},
      child: Text(label),
    );
  }
}
