import 'package:flutter/material.dart';
import 'package:planyourshape/http_handler.dart';
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
      onPressed: () {
        HttpHandler httpHandler = HttpHandler();

        httpHandler.register(
            firstname: "Chloé",
            lastname: "Fontaine",
            username: "cocotte",
            email: "cocotte@gmail.com",
            password: "cocotte minute");
      },
      child: Text(label),
    );
  }
}
