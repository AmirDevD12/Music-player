import 'package:flutter/material.dart';

class ArrangementContainer extends StatelessWidget {
  final Function() onTap;
  final Widget child;
  final Color color;
  const ArrangementContainer({super.key, required this.child, required this.onTap, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 20),
        color: color,
        child: child,
      ),
    );
  }
}
