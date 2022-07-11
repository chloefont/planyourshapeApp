import 'package:flutter/material.dart';

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
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          boxShadow: [
            BoxShadow(
              blurRadius: 19.0,
              spreadRadius: 0.0,
              color: Theme.of(context).colorScheme.secondary,
              offset: const Offset(0, 4),
            )
          ]),
      child: child,
    );
  }
}
