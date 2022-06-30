import 'dart:ffi';
import '../widgets/forms/forms.dart';

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
              Card(
                height: 300,
                width: 350,
                child: Padding(
                    padding: const EdgeInsets.all(8.0), child: LineForm()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  final double height;
  final double width;
  final Widget? child;

  const Card({
    required this.height,
    required this.width,
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.8),
      height: height,
      width: 350,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          blurRadius: 19.0,
          spreadRadius: 0.0,
          color: Color(0xFFF0D8D8),
          offset: Offset(0, 4),
        )
      ]),
      child: child,
    );
  }
}
