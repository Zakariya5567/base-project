import 'package:flutter/material.dart';
import 'package:flutter_base_project/utils/constant.dart';
import 'package:flutter_base_project/utils/style.dart';
import 'package:flutter_base_project/view/widgets/custom_button.dart';
import 'package:flutter_base_project/view/widgets/extention/int_extension.dart';
import 'package:flutter_base_project/view/widgets/extention/string_extension.dart';
import 'package:flutter_base_project/view/widgets/extention/widget_extension.dart';

import '../../../data/model/connection_model/connection_model.dart';
import '../../../utils/colors.dart';

class NoConnection extends StatelessWidget {
  const NoConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConnectionModel args =
        ModalRoute.of(context)!.settings.arguments as ConnectionModel;

    debugPrint("screen is : ${args.currentScreen}");
    debugPrint("message is : ${args.message}");

    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: whitePrimary,
        appBar: AppBar(
          backgroundColor: whitePrimary,
          elevation: 0,
          // Back Button on
          // leading:
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Error Icon
              16.height,
              SizedBox(
                width: 312,
                child: args.message.toText(
                  textAlign: TextAlign.center,
                  maxLine: 2,
                  fontSize: 18,
                  fontFamily: poppinsMedium,
                  color: whitePrimary,
                ),
              ),
              32.height,
              CustomButton(
                buttonName: Constant.tryAgain,
                buttonTextColor: whitePrimary,
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  } else {
                    Navigator.pushNamedAndRemoveUntil(
                        context, args.currentScreen, (route) => false);
                  }
                },
              ),
            ],
          ).paddingSymmetric(horizontal: 16.w),
        ),
      ),
    );
  }
}
