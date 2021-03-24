import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/modules/Authentication/model/customerInfoModel.dart';
import 'package:yasr/app/modules/Authentication/model/smsSendCodeModel.dart';
import 'package:yasr/app/modules/Authentication/provider/Authentication_provider.dart';
import 'package:yasr/app/routes/app_pages.dart';
import 'package:yasr/app/services/services.dart';
import 'package:yasr/app/utils/AppConstant.dart';
import 'package:yasr/app/utils/AppUtils.dart';

class AuthenticationController extends GetxController {
  var autovalidateMode = AutovalidateMode.disabled.obs;

  AuthenticationProvider _authenticationProvider;

  TextEditingController fullName;
  TextEditingController phone;
  TextEditingController address;
  TextEditingController idNumber;
  TextEditingController activationCode;
  String cityID;
  bool termsConditionsStatus;

  @override
  void onInit() {
    fullName = TextEditingController();
    phone = TextEditingController();
    address = TextEditingController();
    idNumber = TextEditingController();
    activationCode = TextEditingController();
    termsConditionsStatus = false;
    _authenticationProvider = AuthenticationProvider();

    phone.text = "01090468201";
    idNumber.text = "29302101301234";
    super.onInit();
  }

  void signinClient() {
    _authenticationProvider
        .signinClient(
      phone: phone.text.trim(),
      idNumber: idNumber.text.trim(),
    )
        .then((value) {
      final customerInfoModel = customerInfoModelFromJson(value);

      Get.find<UserServices>()
          .setUserToken(customerInfoModel.result.customerInfo.token.toString());

      Get.find<UserServices>().setfullName(
          customerInfoModel.result.customerInfo.fullname.toString());

      Get.find<UserServices>().setUserRole('0');

      Get.find<UserServices>().setphoneNumber(
          customerInfoModel.result.customerInfo.phone.toString());

      print(customerInfoModel.result.customerInfo.token.toString());

      AppUtils().showSnackBar(
          title: appName,
          message:
              ' ${customerInfoModel.result.customerInfo.fullname} مرحبا بكم فى التطبيق ',
          onstatusBarClosed: () {
            Get.toNamed(Routes.CLIENT);
          });
    }, onError: (err) {
      var jsonRespons = json.decode(err);
      print(err);
      switch (jsonRespons['codenum']) {
        case 405:
          AppUtils().showSnackBar(
            title: appName,
            message: jsonRespons['message'],
            onstatusBarClosed: () {
              Get.toNamed(Routes.UserOtpView);
            },
          );
          break;

        case 401:
          AppUtils().showSnackBar(
              title: appName,
              message: jsonRespons['message'],
              onstatusBarClosed: () {});
          break;

        default:
          AppUtils().showSnackBar(
              title: appName,
              message: jsonRespons['message'],
              onstatusBarClosed: () {});
      }
    });
  }

  void createClientAccount() {
    _authenticationProvider
        .createClientAccount(
      fullname: fullName.text,
      address: address.text,
      cityId: cityID,
      idNumber: idNumber.text.trim(),
      phone: phone.text.trim(),
    )
        .then((value) {
      print('AuthenticationController createClientAccount');
      print(value);

      //smsSend(phone: phone);

      fullName.clear();
      address.clear();
      //idNumber.clear();
      //phone.clear();

      AppUtils().showSnackBar(
          title: appName,
          message: 'تم التسجيل بنجاح',
          onstatusBarClosed: () {
            Get.toNamed(Routes.ClientSigninView);
          });
    }, onError: (err) {
      AppUtils()
          .showSnackBar(title: appName, message: err, onstatusBarClosed: () {});
    });
  }

  void createLawyerAccount() {
    _authenticationProvider
        .createClientAccount(
      fullname: fullName.text,
      address: address.text,
      cityId: cityID,
      idNumber: idNumber.text.trim(),
      phone: phone.text.trim(),
    )
        .then((value) {
      print('AuthenticationController createClientAccount');
      print(value);

      //smsSend(phone: phone);

      fullName.clear();
      address.clear();
      //idNumber.clear();
      //phone.clear();

      AppUtils().showSnackBar(
          title: appName,
          message: 'تم التسجيل بنجاح',
          onstatusBarClosed: () {
            Get.toNamed(Routes.LawyerSigninView);
          });
    }, onError: (err) {
      AppUtils()
          .showSnackBar(title: appName, message: err, onstatusBarClosed: () {});
    });
  }

  void signinLawyer() {
    _authenticationProvider
        .signinLawyer(
      phone: phone.text.trim(),
      idNumber: idNumber.text.trim(),
    )
        .then((value) {
      print(value);
      final customerInfoModel = customerInfoModelFromJson(value);

      Get.find<UserServices>()
          .setUserToken(customerInfoModel.result.customerInfo.token.toString());

      

      Get.find<UserServices>().setUserRole('1');

      Get.find<UserServices>().setfullName(
          customerInfoModel.result.customerInfo.fullname.toString());

      Get.find<UserServices>().setphoneNumber(
          customerInfoModel.result.customerInfo.phone.toString());

      print(customerInfoModel.result.customerInfo.token.toString());

      AppUtils().showSnackBar(
          title: appName,
          message:
              ' ${customerInfoModel.result.customerInfo.fullname} مرحبا بكم فى التطبيق ',
          onstatusBarClosed: () {
            Get.toNamed(Routes.LAWYER);
          });
    }, onError: (err) {
      var jsonRespons = json.decode(err);
      print(err);
      switch (jsonRespons['codenum']) {
        case 405:
          AppUtils().showSnackBar(
            title: appName,
            message: jsonRespons['message'],
            onstatusBarClosed: () {
              Get.toNamed(Routes.UserOtpView);
            },
          );
          break;

        case 401:
          AppUtils().showSnackBar(
              title: appName,
              message: jsonRespons['message'],
              onstatusBarClosed: () {});
          break;

        default:
          AppUtils().showSnackBar(
              title: appName,
              message: jsonRespons['message'],
              onstatusBarClosed: () {});
      }
    });
  }

  void smsSend() {
    AuthenticationProvider().smsSend(phone: phone.text.trim()).then((value) {
      final smsSendCodeModel = smsSendCodeModelFromJson(value);

      print(value);
      AppUtils().showSnackBar(
        title: appName,
        message: 'تم ارسال كود التفعيل',
        onstatusBarClosed: () {},
      );
    }, onError: (err) {
      AppUtils().showSnackBar(
        title: appName,
        message: err,
        onstatusBarClosed: () {},
      );
    });
  }

  void smsConfirm() {
    print(activationCode.text.trim());
    print(phone.text.trim());

    _authenticationProvider
        .smsConfirm(
      phone: phone.text.trim(),
      activationCode: activationCode.text.trim(),
    )
        .then((value) {
      AppUtils().showSnackBar(
          title: appName,
          message: 'تم تفعيل الحساب',
          onstatusBarClosed: () {
            Get.back();
          });
    }, onError: (err) {
      AppUtils()
          .showSnackBar(title: appName, message: err, onstatusBarClosed: () {});
    });
  }
}
