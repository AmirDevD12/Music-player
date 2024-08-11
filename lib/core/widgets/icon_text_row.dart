import 'package:flutter/material.dart';
import 'package:amir_music/core/resource/my_colors.dart';
import 'package:amir_music/core/resource/typography.dart';



class IconTextRow extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;

  const IconTextRow({super.key, required this.title, required this.icon, required this.onTap, });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 44,
          child: ListTile(
            leading: Image.asset(
              icon,
              width: 25,
              height: 25,
              fit: BoxFit.contain,
            ),
            title: Text(
              title,
              style: Fonts.xs.copyWith(color: MyColors.white,),
            ),
            onTap: onTap,
          ),
        ),
        Divider(
          color: MyColors.background.withOpacity(0.07),
          indent: 70,
        ),
      ],
    );
  }
}