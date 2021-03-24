import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/modules/Authentication/controllers/authentication_controller.dart';
import 'package:yasr/app/routes/app_pages.dart';
import 'package:yasr/app/utils/AppConstant.dart';
import 'package:yasr/app/utils/AppEnumeration.dart';
import 'package:yasr/app/utils/AppUtils.dart';
import 'package:yasr/app/utils/AppValidation.dart';
import 'package:yasr/app/widget/CustemDropdownButton.dart';
import 'package:yasr/app/widget/CustomCheckBox.dart';
import 'package:yasr/app/widget/CustomTextFormFiled.dart';

class ClientSignupView extends GetView<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a new account'.tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Form(
          key: _formKey,
          //autovalidateMode: controller.autovalidateMode.value,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomTextFormFiled(
                  inputController: controller.fullName,
                  inputLabel: 'customer name'.tr,
                  inputHit: 'Please enter the name'.tr,
                  keyboardType: TextInputType.name,
                  onValidator: (value) {
                    return AppValidation.checkEmpty(value);
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
                CustomDropdownButton(
                  listDropdown:
                      ListCity.map((e) => e['state_name'].toString()).toList(),
                  listDropdownValue:
                      ListCity.map((e) => int.parse(e['state_id'].toString()))
                          .toList(),
                  labelDropdownButton: 'City'.tr,
                  onChanged: (value) {
                    controller.cityID = value;
                    print(value);
                  },
                ),
                CustomTextFormFiled(
                  inputController: controller.address,
                  inputLabel: 'Clients address'.tr,
                  inputHit: 'Please enter the address'.tr,
                  keyboardType: TextInputType.name,
                  onValidator: (value) {
                    return AppValidation.checkEmpty(value);
                  },
                ),
                CustomCheckBox(
                  labelCheckBox: 'I agree to the usage policy'.tr,
                  onChanged: (value) {
                    controller.termsConditionsStatus = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: RaisedButton(
                    onPressed: () {
                      // FocusScope.of(context).unfocus();
                      FocusScope.of(context).requestFocus(new FocusNode());

                      if (_formKey.currentState.validate()) {
                        if (controller.termsConditionsStatus) {
                          controller.createClientAccount();
                        } else {
                          AppUtils().showSnackBar(
                              title: appName,
                              message: 'termsConditionsStatus',
                              onstatusBarClosed: () {});
                        }
                      } else {
                        //    controller.autovalidateMode.value =
                        //      AutovalidateMode.onUserInteraction;
                      }
                    },
                    child: Text('Create an account'.tr),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
