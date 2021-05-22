import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/api/response_model.dart';
import 'package:yasr/app/api/web_serives.dart';
import 'package:yasr/app/data/helper/AppConstant.dart';
import 'package:yasr/app/data/helper/AppUtils.dart';
import 'package:yasr/app/modules/home_lawyer/controllers/lawyer_controller.dart';
import 'package:yasr/app/modules/order/model/order_lawer_detailes.dart';

class OrderProviderController extends GetxController {
  TextEditingController offer_price = new TextEditingController();
  TextEditingController offer_title = new TextEditingController();

  //TODO: Implement OrderProviderController

  @override
  void onInit() {
    super.onInit();
  }

  Future addLawyerOffer(int id_request) async {
    if (GetUtils.isNullOrBlank(offer_title.text) ||
        GetUtils.isNullOrBlank(offer_price.text)) {
      AppUtils().showSnackBar(
          title: appName,
          message: ' برجاء ملائة البيانات ',
          onstatusBarClosed: () {});
    } else {
      ResponsModel responsModel = await WebServices().addLawyerOffer(
        id_request,
        offer_title.text,
        offer_price.text,
      );

      if (responsModel.success) {
        Response response = responsModel.data;
        if (response.statusCode == 200) {
          AppUtils().showSnackBar(
            title: appName,
            message: ' تم ارسال العرض ',
            onstatusBarClosed: () {
              LawyerController controller = Get.find();
              controller.getRequestLawer(0);
              Get.back();
            },
          );
        }
      }
    }
  }

  Future getLawerRequestDetails(int id_request) async {
    ResponsModel responsModel =
        await WebServices().getRequestDetails(id_request);

    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['status']) {
        final requestedLawerDetailesModel =
            requestedLawerDetailesModelFromJson(response.bodyString);
        //print(response.bodyString.toString());
        return requestedLawerDetailesModel;
      }
    }
  }
}
