import 'package:flutter/material.dart';
import 'package:amir_music/core/resource/decoration.dart';

class GridSortContainer extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  const GridSortContainer({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          // alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          decoration: DecorationContainer.gridContainer,
          child: child
      ),
    );
  }
}
