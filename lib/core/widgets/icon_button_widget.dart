
import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final String icon;
  final Function() onTap;
  final Color color;
  const IconButtonWidget({super.key, required this.icon, required this.onTap, required this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Image.asset(
        alignment: Alignment.center,
        icon,
        color: color,
        width: 20,
      ),
    );
  }
}
