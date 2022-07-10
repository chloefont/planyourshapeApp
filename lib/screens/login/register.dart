import 'dart:ffi';
import '../../widgets/forms/login_form.dart';
import '../../widgets/cards/main-card.dart';

import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CustCard(
            height: 300,
            width: 350,
            child: Padding(padding: EdgeInsets.all(8.0)),
          ),
        ],
      ),
    );
  }
}
