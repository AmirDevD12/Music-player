
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amir_music/core/resource/my_colors.dart';
import 'package:amir_music/view_model/splash_view_model/splash_view_model.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static const String routeSplashPage = "/SplashPage";

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    final SplashViewModel controller = Get.find();
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(80),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/app_logo.png"),
                  )),
          child: Obx(() => Center(child: controller.content.value)),
        ),
      ),
    );
  }
}



