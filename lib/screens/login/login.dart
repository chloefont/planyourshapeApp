import 'dart:ffi';
import 'login_form.dart';
import '../../widgets/cards/main-card.dart';

import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CustCard(
                height: 300,
                width: 350,
                child:
                    Padding(padding: EdgeInsets.all(8.0), child: LoginForm()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
