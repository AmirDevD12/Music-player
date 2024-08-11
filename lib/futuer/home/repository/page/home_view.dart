import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amir_music/core/resource/my_colors.dart';
import 'package:amir_music/core/widgets/bottomnavigation_widget.dart';
import 'package:amir_music/core/widgets/icon_text_row.dart';
import 'package:amir_music/view_model/splash_view_model/splash_view_model.dart';
import '../controller/home_controller.dart';

class HomeViewWidget extends StatefulWidget {
  const HomeViewWidget({super.key});

  static const routerHomeViewWidget = "/HomeViewWidget";

  @override
  State<HomeViewWidget> createState() => _HomeViewWidgetState();
}

class _HomeViewWidgetState extends State<HomeViewWidget> {
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var splashVM = Get.find<SplashViewModel>();
    return Scaffold(
      key: splashVM.scaffoldKey,
      backgroundColor: MyColors.background,
        drawer: Drawer(
            backgroundColor: const Color(0xff10121D),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 240,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: MyColors.background.withOpacity(0.03),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/app_logo.png",
                          width: media.width * 0.17,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "328\nSongs",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xffC1C0C0), fontSize: 12),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "52\nAlbums",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xffC1C0C0), fontSize: 12),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "87\nArtists",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xffC1C0C0), fontSize: 12),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                IconTextRow(
                  title: "Themes",
                  icon: "assets/icon/m_theme.png",
                  onTap: () {},
                ),
                IconTextRow(
                  title: "Ringtone Cutter",
                  icon: "assets/icon/m_ring_cut.png",
                  onTap: () {},
                ),

                IconTextRow(
                  title: "Sleep Timer",
                  icon: "assets/icon/m_sleep_timer.png",
                  onTap: () {},
                ),
                IconTextRow(
                  title: "Equalizer",
                  icon: "assets/icon/m_eq.png",
                  onTap: () {},
                ),
                IconTextRow(
                  title: "Driver Mode",
                  icon: "assets/icon/m_driver_mode.png",
                  onTap: () {},
                ),

                IconTextRow(
                  title: "Hidden Folders",
                  icon: "assets/icon/m_hidden_folder.png",
                  onTap: () {},
                ),
                IconTextRow(
                  title: "Scan Media",
                  icon: "assets/icon/m_scan_media.png",
                  onTap: () {},
                ),
              ],
            )),
      body:  WillPopScope(
        onWillPop: () async{
          return false;
         // return homeController.scaffoldWidget.value.toString()=="HomeWidget"?true:false;
        },
        child: SafeArea(
          child:GetBuilder<HomeController>(
          init: HomeController(),
            builder: (HomeController controller) {
        return controller.toggelWidgetHomePage(controller.indexPage.value);
            })
        ),
      ),
      bottomNavigationBar:BottomNavigationWidget()
    );
  }
}

