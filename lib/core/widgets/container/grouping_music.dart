import 'package:flutter/material.dart';
import 'package:amir_music/core/resource/decoration.dart';

class GroupingMusicContainer extends StatelessWidget {
  final Widget child;
  final Function() onTap;
  const GroupingMusicContainer({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(

        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: DecorationContainer.groupingDecoration,
        child: child,
      ),
    );
  }
}
