import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/modules/Authentication/controllers/authentication_controller.dart';
import 'package:yasr/app/data/helper/AppValidation.dart';
import 'package:yasr/app/data/component/CustomTextFormFiled.dart';

class UserOtpView extends GetView<AuthenticationController> {
  final _formKey = GlobalKey<FormState>();

  String phonenumber = Get.arguments[0];
  int usertype = Get.arguments[1];

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
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState.validate()) {
                      // Get.toNamed(Routes.CLIENT);
                      controller.smsConfirm(usertype, phonenumber);
                    }
                  },
                  child: Text('Account Confirmation'.tr),
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();

                    controller.smsSend(usertype, phonenumber);
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
