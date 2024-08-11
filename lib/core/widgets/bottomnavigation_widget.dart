import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amir_music/core/resource/my_colors.dart';
import 'package:amir_music/futuer/home/repository/controller/home_controller.dart';
import 'package:amir_music/view_model/splash_view_model/splash_view_model.dart';

class BottomNavigationWidget extends StatelessWidget {
  BottomNavigationWidget({super.key});

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primary,
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      width: double.infinity,
      child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (HomeController controller) {

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      homeController.changeIndexPage(0);
                    },
                    icon: Icon(Icons.home,
                        size: homeController.indexPage.value == 0 ? 40 : 25,
                        color: homeController.selectedIcon.value == Icons.home
                            ? MyColors.white
                            : MyColors.backIcon)),
                IconButton(
                    onPressed: () {
                      homeController.changeIndexPage(1);
                    },
                    icon: Icon(Icons.search,
                        size: homeController.indexPage.value == 1 ? 40 : 25,
                        color: homeController.indexPage.value == 1
                            ? MyColors.white
                            : MyColors.backIcon)),
                IconButton(
                    onPressed: () {
                      homeController.changeIndexPage(2);
                    },
                    icon: Image.asset(
                      "assets/icon/home_tab.png",
                      width: homeController.indexPage.value != 2 ? 20 : 30,
                      color: homeController.indexPage.value == 2
                          ? MyColors.white
                          : MyColors.backIcon,
                    )),
                GetBuilder<SplashViewModel>(
                    init: SplashViewModel(),
                    builder: (SplashViewModel controller) {

                      return IconButton(
                          onPressed: () {
                            Get.find<SplashViewModel>().openDrawer();
                            controller.isOpenDrawer.value=controller.scaffoldKey.currentState!.isDrawerOpen;

                          },
                          icon: Image.asset(
                            "assets/icon/setting_tab.png",
                            width: controller.isOpenDrawer.value ? 30 : 20,
                            color: controller.isOpenDrawer.value
                                ? MyColors.white
                                : MyColors.backIcon,
                          ));
                    })
              ],
            );
          })
    );
  }
}
