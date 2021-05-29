import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/api/api_manger.dart';
import 'package:yasr/app/api/response_model.dart';
import 'package:yasr/app/api/web_serives.dart';
import 'package:yasr/app/data/helper/AppConstant.dart';
import 'package:yasr/app/data/helper/AppUtils.dart';
import 'package:yasr/app/modules/Authentication/model/customerInfoModel.dart';
import 'package:yasr/app/routes/app_pages.dart';
import 'package:yasr/app/services/auth.dart';
import 'package:get/get_connect/connect.dart' as http;


class AuthenticationController extends GetxController {
  TextEditingController fullName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController idNumber = TextEditingController();
  TextEditingController activationCode = TextEditingController();
  String cityID;
  bool termsConditionsStatus = false;
  TextEditingController password = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void signinClient() async {
    ResponsModel responsModel = await WebServices().signin(
      phone: phone.text.trim(),
      password: password.text.trim(),
      user_type: '0',
    );

    if (responsModel.success) {
      Response response = responsModel.data;

      if (response.body['status']) {
        final customerInfoModel =
            customerInfoModelFromJson(response.bodyString);

        UserServices userServices = Get.find<UserServices>();

        userServices.setUserToken(
            customerInfoModel.result.customerInfo.token.toString());

        userServices.setfullName(
            customerInfoModel.result.customerInfo.fullname.toString());
        userServices.setUserRole('0');
        userServices.setphoneNumber(
            customerInfoModel.result.customerInfo.phone.toString());

        AppUtils().showSnackBar(
            title: appName,
            message: ' تم تسجيل الدخول ',
            onstatusBarClosed: () {
              Get.toNamed(Routes.CLIENT);
            });
      } else {
        AppUtils().showSnackBar(
            title: appName,
            message: response.body['message'],
            onstatusBarClosed: () {});

        if (response.body['codenum'] == 405) {
          Get.toNamed(Routes.UserOtpView, arguments: [phone.text, 0]);
        }
      }
    }
  }

  void createClientAccount() async {
    ResponsModel responsModel = await WebServices().createClientAccount(
        fullname: fullName.text,
        address: address.text,
        cityId: cityID,
        idNumber: idNumber.text.trim(),
        phone: phone.text.trim(),
        password: password.text);

    if (responsModel.success) {
      Response response = responsModel.data;

      if (response.body['status']) {
        fullName.clear();
        address.clear();
        AppUtils().showSnackBar(
            title: appName,
            message: 'تم التسجيل بنجاح',
            onstatusBarClosed: () {
              Get.toNamed(Routes.ClientSigninView);
            });
      } else {
        AppUtils().showSnackBar(
            title: appName,
            message: response.body['message'],
            onstatusBarClosed: () {});
      }
    }
  }

  void createLawyerAccount() async {
    ResponsModel responsModel = await WebServices().createLawyerAccount(
      fullname: fullName.text,
      address: address.text,
      cityId: cityID,
      idNumber: idNumber.text.trim(),
      phone: phone.text.trim(),
    );

    if (responsModel.success) {
      Response response = responsModel.data;

      if (response.body['status']) {
        fullName.clear();
        address.clear();
        AppUtils().showSnackBar(
            title: appName,
            message: 'تم التسجيل بنجاح',
            onstatusBarClosed: () {
              Get.toNamed(Routes.ClientSigninView);
            });
      } else {
        AppUtils().showSnackBar(
            title: appName,
            message: response.body['message'],
            onstatusBarClosed: () {});
      }
    }
  }

  void signinLawyer() async {
    ResponsModel responsModel = await WebServices().signin(
      phone: phone.text.trim(),
      password: password.text.trim(),
      user_type: '1',
    );

    if (responsModel.success) {
      Response response = responsModel.data;

      if (response.body['status']) {
        final customerInfoModel =
            customerInfoModelFromJson(response.bodyString);

        Get.find<UserServices>().setUserToken(
            customerInfoModel.result.customerInfo.token.toString());
        Get.find<UserServices>().setfullName(
            customerInfoModel.result.customerInfo.fullname.toString());
        Get.find<UserServices>().setUserRole('1');
        Get.find<UserServices>().setphoneNumber(
            customerInfoModel.result.customerInfo.phone.toString());

        AppUtils().showSnackBar(
            title: appName,
            message: ' تم تسجيل الدخول ',
            onstatusBarClosed: () {
              Get.toNamed(Routes.LAWYER);
            });
      } else {
        AppUtils().showSnackBar(
          title: appName,
          message: response.body['message'],
          onstatusBarClosed: () {},
        );

        if (response.body['codenum'] == 405) {
          Get.toNamed(
            Routes.UserOtpView,
            arguments: [phone.text, 0],
          );
        }
      }
    }
  }

  void smsSend(int userType, String phone) async {
    ResponsModel responsModel = await WebServices().smsSend(
      phone: phone,
      userType: userType,
    );

    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['status']) {
        AppUtils().showSnackBar(
          title: appName,
          message:
              'كود التفعيل هو ${response.body['result']['activation_code']}',
          onstatusBarClosed: () {},
        );
      } else {
        AppUtils().showSnackBar(
          title: appName,
          message: 'غير مسموح اعادة الارسال لمدة دقيقة',
          onstatusBarClosed: () {},
        );
      }
    }
  }

  void smsConfirm(int userType, String phone) async {







    ResponsModel responsModel = await WebServices().smsConfirm(
      phone: '0800800800',
      activationCode: '1234',
      userType: 0,
    );

    if (responsModel.success) {
      Response response = responsModel.data;

      print(response.bodyString);

      if (response.body['status']) {
        AppUtils().showSnackBar(
            title: appName,
            message: 'تم تفعيل الحساب',
            onstatusBarClosed: () {
              Get.back();
            });
      } else {
        AppUtils().showSnackBar(
            title: appName,
            message: 'خطاء فى التفعيل',
            onstatusBarClosed: () {});
      }

    }
    
      
  }
}
