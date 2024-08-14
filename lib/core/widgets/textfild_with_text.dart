import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amir_music/core/resource/my_colors.dart';
import 'package:amir_music/core/resource/typography.dart';
import 'package:amir_music/futuer/home/repository/controller/home_controller.dart';

class TextFiledText extends StatelessWidget {
  final String textInput;

  const TextFiledText({Key? key, required this.textInput}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: MyColors.primary,
            blurRadius: 1.0,
            spreadRadius: 0.0,
            offset: const Offset(0.0, 0.0),
          ),
        ],
      ),
      height: 50,
      child: TextField(
        maxLines: 1,
        cursorColor: Colors.black,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          label: Row(
            children: [
              Icon(Icons.search,color: MyColors.backIcon,),
              Text(
                textInput,
                style: Fonts.xs.copyWith(
                    fontWeight: FontWeight.bold, color: MyColors.backIcon),
              )
            ],
          ),
          fillColor: MyColors.primary,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
