import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/modules/Authentication/controllers/authentication_controller.dart';
import 'package:yasr/app/routes/app_pages.dart';
import 'package:yasr/app/utils/AppUtils.dart';
import 'package:yasr/app/utils/AppValidation.dart';
import 'package:yasr/app/widget/CustomTextFormFiled.dart';

class UserOtpView extends GetView<AuthenticationController> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  ' سوف تصلك رسالة تأكيد الحساب في اسرع وقت برجاء ادخال كود الرسالة لتاكيد الحساب واتمام الدخول',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                CustomTextFormFiled(
                  inputController: controller.activationCode,
                  inputLabel: 'كود الرسالة',
                  inputHit: 'Enter the message code'.tr,
                  keyboardType: TextInputType.number,
                  onValidator: (value) {
                    return AppValidation.equallength(value, 4);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      // Get.toNamed(Routes.CLIENT);
                      controller.smsConfirm();
                    }
                  },
                  child: Text('Account Confirmation'.tr),
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  onPressed: () {
                   
                      // Get.toNamed(Routes.CLIENT);
                      controller.smsSend();
                    
                  },
                  child: Text('ارسال كود التفعيل'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
