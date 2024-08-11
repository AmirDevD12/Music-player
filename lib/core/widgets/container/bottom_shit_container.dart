import 'package:flutter/material.dart';
import 'package:amir_music/core/resource/my_colors.dart';

class BottomShitContainer extends StatelessWidget {
  final Widget child;
  const BottomShitContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return   Container(
      padding:
      const EdgeInsets.symmetric(vertical: 10,),
      decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40))),
      child: child

    );
  }
}
