import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/modules/Authentication/controllers/authentication_controller.dart';
import 'package:yasr/app/routes/app_pages.dart';
import 'package:yasr/app/utils/AppEnumeration.dart';
import 'package:yasr/app/utils/AppUtils.dart';
import 'package:yasr/app/utils/AppValidation.dart';
import 'package:yasr/app/widget/CustemDropdownButton.dart';
import 'package:yasr/app/widget/CustomCheckBox.dart';
import 'package:yasr/app/widget/CustomTextFormFiled.dart';

class LawyerSignupView extends GetView<AuthenticationController> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create an account lawer'.tr),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              CustomTextFormFiled(
                inputController: controller.fullName,
                inputLabel: 'lawer name'.tr,
                inputHit: 'Please enter the name'.tr,
                keyboardType: TextInputType.text,
                onValidator: (value) {
                  return AppValidation.checkEmpty(value);
                },
              ),
              CustomTextFormFiled(
                inputController: controller.address,
                inputLabel: 'lawer address'.tr,
                inputHit: 'Please enter the address'.tr,
                keyboardType: TextInputType.text,
                onValidator: (value) {
                  return AppValidation.checkEmpty(value);
                },
              ),
              CustomDropdownButton(
                listDropdown:
                    ListCity.map((e) => e['state_name'].toString()).toList(),
                listDropdownValue:
                    ListCity.map((e) => int.parse(e['state_id'].toString()))
                        .toList(),
                labelDropdownButton: 'City'.tr,
                onChanged: (value) {
                  // controller.s
                },
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
                keyboardType: TextInputType.number,
                onValidator: (value) {
                  return AppValidation.checkEmpty(value);
                },
              ),
              CustomCheckBox(
                labelCheckBox: 'أوافق على سياسة الاستخدام',
              ),
              SizedBox(
                height: 15,
              ),
              RaisedButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(new FocusNode());

                  if (_formKey.currentState.validate()) {
                    controller.createLawyerAccount();
                  }
                },
                child: Text('Create an account'.tr),
              ),
            ],
          ),
        ),
      ),
    );
  }
}