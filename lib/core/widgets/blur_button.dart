import 'dart:ui';

import 'package:flutter/material.dart';

class BlurButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const BlurButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.2), // Adjust opacity as needed
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}