import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter_base_project/data/model/connection_model/connection_model.dart';
import 'package:flutter_base_project/utils/constant.dart';
import '../helper/routes_helper.dart';

Future<bool> checkInternet(
  NavigatorState navigator,
  String screen,
) async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    if (await InternetConnectionChecker().hasConnection) {
      debugPrint("Connected with mobile");
      return true;
    } else {
      debugPrint("no connection");
      navigateToNoConnectionScreen(navigator, screen);
      return false;
    }
  } else if (connectivityResult == ConnectivityResult.wifi) {
    if (await InternetConnectionChecker().hasConnection) {
      debugPrint("Connected with wifi");
      return true;
    } else {
      navigateToNoConnectionScreen(navigator, screen);
      debugPrint("no connection");
      return false;
    }
  } else {
    debugPrint(" not Connected");
    navigateToNoConnectionScreen(navigator, screen);
    return false;
  }
}

void navigateToNoConnectionScreen(NavigatorState navigator, String screen) {
  Future.delayed(Duration.zero, () {
    navigator.pushReplacementNamed(
      RouterHelper.noConnectionScreen,
      arguments: ConnectionModel(
        currentScreen: screen,
        message: Constant.internetConnectionMessage,
      ),
    );
  });
}
