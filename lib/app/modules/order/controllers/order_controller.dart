import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/interceptors/get_modifiers.dart';
import 'package:yasr/app/api/response_model.dart';
import 'package:yasr/app/api/web_serives.dart';
import 'package:yasr/app/modules/order/model/offer_detailes.dart';
import 'package:yasr/app/modules/order/model/order_detailes_model.dart';
import 'package:yasr/app/modules/order/model/order_lawer_detailes.dart';
import 'package:yasr/app/modules/order/model/order_model.dart';
import 'package:yasr/app/routes/app_pages.dart';
import 'package:yasr/app/data/helper/AppConstant.dart';
import 'package:yasr/app/data/helper/AppUtils.dart';

class OrderController extends GetxController {
  //TODO: Implement OrderController
  String client_type;
  String requested_type;
  String requested_state;
  TextEditingController requested_title = new TextEditingController();
  TextEditingController requested_description = new TextEditingController();
  File ImageFile;

  var allRequests = List<AllRequest>().obs;

  var requesteDetail = Future.value().obs;

  getClientOrderList({@required int requestid}) async {
    ResponsModel responsModel =
        await WebServices().getClientOrderList(requestType: requestid);

        print(requestid);

    if (responsModel.success) {
      Response response = responsModel.data;
      final requestedModel = requestedModelFromJson(response.bodyString);
      allRequests.clear();
      allRequests.addAll(requestedModel.result.allRequests);
    }
  }

  getClientOrderDetailes(String id_request) async {
    ResponsModel responsModel =
        await WebServices().getClientOrderDetailes(id_request);

    if (responsModel.success) {
      Response response = responsModel.data;
      final requestedDetailesModel =
          requestedDetailesModelFromJson(response.bodyString);
      requesteDetail.value = Future.value(requestedDetailesModel);
    }
  }

  createClientOrder() async {
    ResponsModel responsModel = await WebServices().createClientOrder(
      client_type: client_type,
      requested_type: requested_type,
      requested_state: requested_state,
      requested_title: requested_title.text,
      requested_description: requested_description.text,
      file: ImageFile,
    );

    if (responsModel.success) {
      Response response = responsModel.data;

      if (response.body['status']) {
        AppUtils().showSnackBar(
          title: appName,
          message: 'تم الاضافة بنجاح',
          onstatusBarClosed: () {
            Get.toNamed(Routes.CLIENT, arguments: ["0"]);
          },
        );
      }
    }
  }

  void recordSound() {
    /*
    bool hasPermission = await FlutterAudioRecorder.hasPermissions;
var recorder = FlutterAudioRecorder("file_path.mp4"); // .wav .aac .m4a
await recorder.initialized;
await recorder.start();
var recording = await recorder.current(channel: 0);*/
  }

  TextEditingController offer_price = new TextEditingController();
  TextEditingController offer_title = new TextEditingController();

  OfferDetailes(int id_request, int id_lawyer) async {
    ResponsModel responsModel = await WebServices()
        .offerDeatiles(id_request: id_request, id_lawyer: id_lawyer);

    if (responsModel.success) {
      Response response = responsModel.data;
      print(response.body['status']);
      if (response.body['status']) {
        final requestedOfferModel =
            requestedOfferModelFromJson(response.bodyString);
        return requestedOfferModel;
      } else {
        Get.snackbar(appName, response.body['message']);
      }
    }
  }

  chose_lawyer(
    String id_lawyer,
    String id_request,
    String payment_value,
  ) async {
    ResponsModel responsModel = await WebServices().chose_lawyer(
      payment_value: payment_value,
      id_lawyer: id_lawyer,
      id_offer: '',
      id_request: id_request,
    );

    if (responsModel.success) {
      Response response = responsModel.data;

      if (response.body['status']) {
        Get.snackbar(appName, 'تم اختيار المحامى');
        Get.toNamed(Routes.CLIENT, arguments: ["0"]);
      }
    }
  }
}
