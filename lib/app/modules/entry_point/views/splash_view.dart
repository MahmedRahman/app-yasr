import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:yasr/app/modules/Authentication/controllers/authentication_controller.dart';

import 'package:yasr/app/routes/app_pages.dart';
import 'package:yasr/app/services/auth.dart';

class SplashView extends GetView {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          //  _controller.getuserphone();
          if (Get.find<UserServices>().getUserRole() == '1') {
            Get.toNamed(Routes.LAWYER);
          } else if (Get.find<UserServices>().getUserRole() == '0') {
            Get.toNamed(Routes.CLIENT);
          } else {
            Get.toNamed(Routes.UserTypeView);
          }
        },
        child: Container(
          height: Get.height,
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: Get.width * .6,
                child: Image.asset('assets/image/logo.png'),
              ),
              SizedBox(
                width: Get.width * .3,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballPulse,
                  color: Color(0xFF1D976C),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
