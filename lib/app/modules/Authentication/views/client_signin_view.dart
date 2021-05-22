import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/modules/Authentication/controllers/authentication_controller.dart';
import 'package:yasr/app/routes/app_pages.dart';
import 'package:yasr/app/data/helper/AppValidation.dart';
import 'package:yasr/app/data/component/CustomTextFormFiled.dart';

class ClientSigninView extends GetView<AuthenticationController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.phone.text="01223846165";
    controller.password.text="123456";

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Container(
            height: Get.height,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Get.width*.5,
                    child: Image.asset(
                      'assets/image/logo.png',
                    ),
                  ),Text('تسجيل دخول العميل'),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFormFiled(
                    inputController: controller.phone,
                    inputLabel: 'phone'.tr,
                    inputHit: 'Enter the phone or mobile number'.tr,
                    keyboardType: TextInputType.phone,
                    onValidator: (value) {
                      return AppValidation.checkMobile(value);
                    },
                  ),
                  CustomTextFormFiled(
                    inputController: controller.password,
                    inputLabel: 'كلمة السر',
                    inputHit: 'Enter ID Number'.tr,
                    keyboardType: TextInputType.visiblePassword,
                    
                    onValidator: (value) {
                      return AppValidation.checkEmpty(value);
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  RaisedButton(
                    onPressed: () {
                      FocusScope.of(context).requestFocus(new FocusNode());

                      if (_formKey.currentState.validate()) {
                        //Get.toNamed(Routes.UserOtpView);
                        controller.signinClient();
                      }
                    },
                    child: Text('signin'.tr),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Get.toNamed(Routes.ClientSignupView);
                    },
                    // Get.toNamed(Routes.ClientSignupView),
                    child: Text('signup'.tr),
                  ),
                  Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
