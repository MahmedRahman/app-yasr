import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/routes/app_pages.dart';
import 'package:yasr/app/data/helper/AppTheme.dart';

class UserTypeView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: SizedBox(
              width: Get.width*.7,
              child: Image.asset('assets/image/logo.png'),
            ),
          ),
          Column(
            children: [
              RaisedButton(
                onPressed: () => Get.toNamed(Routes.ClientSigninView),
                child: Text('client'.tr),
              ),
              SizedBox(
                height: Get.height * .03,
              ),
              RaisedButton(
                onPressed: () {
                  Get.toNamed(Routes.LawyerSigninView);
                },
                child: Text('lawyer'.tr),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                '',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
