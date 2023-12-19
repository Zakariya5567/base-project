import 'package:flutter_base_project/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_project/view/widgets/extention/string_extension.dart';
import 'package:flutter_base_project/view/widgets/extention/widget_extension.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: whiteStatusBar(),
      child: Scaffold(
          body: Container(
        child: 'Home Screen'.toText(),
      ).center),
    );
  }
}
