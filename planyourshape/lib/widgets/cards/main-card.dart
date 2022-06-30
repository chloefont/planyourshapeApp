import 'package:flutter/material.dart';
import '../../vars/mainvars.dart';

class CustCard extends StatelessWidget {
  final double height;
  final double width;
  final Widget? child;

  const CustCard({
    required this.height,
    required this.width,
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
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
