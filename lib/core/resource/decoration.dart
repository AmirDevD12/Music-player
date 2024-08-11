import 'package:flutter/cupertino.dart';

import 'my_colors.dart';


class DecorationContainer {
  static BoxDecoration categoryCard = BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: MyColors.black.withOpacity(0.05),
          blurRadius: 35.0,
          spreadRadius: 0.0,
          offset: const Offset(0.0, 0.0),
        )
      ],
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      color: MyColors.white);
  static BoxDecoration primaryContainer = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: MyColors.shadow,
        blurRadius: 365.0,
        spreadRadius: 0.0,
        offset: const Offset(3.36, 12.56),
      )
    ],
    color: MyColors.primary,
    borderRadius: const BorderRadius.all(Radius.circular(20)),
  );
  static BoxDecoration secondaryContainer = BoxDecoration(
        color: MyColors.subTitle,
        boxShadow: [
          BoxShadow(
            color: MyColors.shadow,
            blurRadius: 5.0,
            spreadRadius: 0.0,
            offset: const Offset(0.0, 0.0),
          )
        ],
        borderRadius: const BorderRadius.all(Radius.circular(10))
    );

  static BoxDecoration gridContainer = BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: MyColors.primary.withOpacity(0.1),
          blurRadius: 10.0,
          spreadRadius: 0.0,
          offset: const Offset(0, 4),
        )
      ],
      color: MyColors.primary,
      borderRadius: const BorderRadius.all(Radius.circular(15)));
  static BoxDecoration groupingDecoration = const BoxDecoration(

      borderRadius: BorderRadius.all(Radius.circular(15)),
      );
  static BoxDecoration buttonDecoration = BoxDecoration(
    color: MyColors.white,
    borderRadius: const BorderRadius.all(Radius.circular(20)),
  );
  static BoxDecoration appBarDecoration = BoxDecoration(
    color: MyColors.white,
    boxShadow: [
      BoxShadow(
        color: MyColors.black.withOpacity(0.05),
        blurRadius: 35.0,
        spreadRadius: 0.0,
        offset: const Offset(3.36, 12.56),
      )
    ],
    borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
  );
}
