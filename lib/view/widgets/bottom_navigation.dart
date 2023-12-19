import 'package:flutter_base_project/helper/routes_helper.dart';
import 'package:flutter_base_project/provider/bottom_navigation_provider.dart';
import 'package:flutter_base_project/utils/colors.dart';
import 'package:flutter_base_project/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key, required this.currentIndex})
      : super(key: key);
  final int currentIndex;
  // Bottom navigation the the bottom navigation bar of the app

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationProvider>(
        builder: (context, controller, child) {
      return Container(
        decoration: const BoxDecoration(
          color: whitePrimary,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), topLeft: Radius.circular(25)),
        ),
        child: Material(
          elevation: 0.0,
          color: whitePrimary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              unselectedFontSize: 12,
              selectedFontSize: 12,
              selectedLabelStyle: const TextStyle(fontFamily: poppinsRegular),
              unselectedLabelStyle: const TextStyle(fontFamily: poppinsRegular),
              selectedItemColor: preLudeLight,
              unselectedItemColor: whitePrimary,
              backgroundColor: Colors.transparent,
              elevation: 0,
              currentIndex: controller.currentIndex,
              onTap: (index) {
                // set the current index of the bottom navigation bar
                // the function is declared inside BottomNavigationProvider

                controller.setCurrentIndex(index);
                if (currentIndex != index) {
                  switch (index) {
                    case 0:
                      Navigator.of(context)
                          .pushReplacementNamed(RouterHelper.homeScreen);
                      break;
                    case 1:
                      // Navigator.of(context).pushNamedAndRemoveUntil(
                      //     RouterHelper.moreScreen, (route) => false);
                      break;
                    default:
                      break;
                  }
                }
              },
              items: const <BottomNavigationBarItem>[
                // Remote
                // BottomNavigationBarItem(
                //     icon: SvgPicture.asset(
                //       Images.iconCamera,
                //       height: 18.h,
                //       width: 18.h,
                //       colorFilter: controller.currentIndex == 0
                //           ? const ColorFilter.mode(
                //               preLudeLight, BlendMode.srcIn)
                //           : const ColorFilter.mode(
                //               whitePrimary, BlendMode.srcIn),
                //     ).paddingOnly(bottom: 5.h),
                //     label: Constant.remoteText),
                // // More
                // BottomNavigationBarItem(
                //     icon: SvgPicture.asset(
                //       Images.iconMore,
                //       height: 18.h,
                //       width: 18.h,
                //       colorFilter: controller.currentIndex == 1
                //           ? const ColorFilter.mode(
                //               preLudeLight, BlendMode.srcIn)
                //           : const ColorFilter.mode(
                //               whitePrimary, BlendMode.srcIn),
                //     ).paddingOnly(bottom: 5.h),
                //     label: Constant.moreText),
              ]),
        ),
      );
    });
  }
}
