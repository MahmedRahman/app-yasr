import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/modules/Authentication/controllers/authentication_controller.dart';
import 'package:yasr/app/routes/app_pages.dart';
import 'package:yasr/app/utils/AppEnumeration.dart';
import 'package:yasr/app/utils/AppValidation.dart';
import 'package:yasr/app/widget/CustemDropdownButton.dart';
import 'package:yasr/app/widget/CustomTextFormFiled.dart';

class LawyerSigninView extends GetView<AuthenticationController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              height: Get.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Get.width*.5,
                    child: Image.asset('assets/image/logo.png'),
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
                    inputController: controller.idNumber,
                    inputLabel: 'myid'.tr,
                    inputHit: 'Enter ID Number'.tr,
                    keyboardType: TextInputType.visiblePassword,
                    onValidator: (value) {
                      return AppValidation.checkEmpty(value);
                    },
                  ),

                  /*
                     CustomDropdownButton(
                       listDropdown:
                            ListLawyerUser.map((e) => e['lawyer_type'].toString()).toList(),
                        listDropdownValue:
                            ListLawyerUser.map((e) => int.parse(e['lawyer_id'].toString()) ).toList(),
                  labelDropdownButton: 'نوع المحامى',
                ),
          */
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        controller.signinLawyer();
                      }
                    },
                    child: Text('signin'.tr),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    onPressed: () => Get.toNamed(Routes.LawyerSignupView),
                    child: Text('signup'.tr),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
