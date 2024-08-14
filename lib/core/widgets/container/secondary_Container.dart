import 'package:flutter/material.dart';
import 'package:amir_music/core/resource/decoration.dart';

class SecondaryContainer extends StatelessWidget {
  final Widget child;
  final Function() onTap;
  const SecondaryContainer({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
        decoration: DecorationContainer.secondaryContainer,

        child: child,
      ),
    );
  }
}
