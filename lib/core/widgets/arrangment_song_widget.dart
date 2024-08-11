import 'package:flutter/material.dart';
import 'package:amir_music/core/resource/typography.dart';

class ArrangementWidget extends StatelessWidget {
  final String arrange;
  final bool showIcon;
  const ArrangementWidget({super.key, required this.arrange, required this.showIcon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
            arrange,
            style:Fonts.sm
        ),
       showIcon? const Icon(Icons.check):const SizedBox()
      ],
    );
  }
}
