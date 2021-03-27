import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yasr/app/modules/order/model/order_detailes_model.dart';
import 'package:yasr/app/modules/order/model/order_model.dart';
import 'package:yasr/app/modules/order/provider/order_provider.dart';
import 'package:yasr/app/routes/app_pages.dart';
import 'package:yasr/app/data/helper/AppConstant.dart';
import 'package:yasr/app/data/helper/AppUtils.dart';

class OrderController extends GetxController {
  //TODO: Implement OrderController
  String client_type;
  String requested_type;
  String requested_state;
  TextEditingController requested_title =new TextEditingController();
  TextEditingController requested_description=new TextEditingController();

  var allRequests = List<AllRequest>().obs;

  var requesteDetail = new RequesteDetail().obs;

  getClientOrderList({@required int requestid}) async {
    await OrderProvider(
      
    ).getClientOrderList(
      requestType: requestid
    ).then((value) {
      print(value);

      final requestedModel = requestedModelFromJson(value);
      allRequests.clear();
      allRequests.addAll(requestedModel.result.allRequests);
//requestedModel.result.requestedDetails.

      return '';
    });
  }

  getClientOrderDetailes(String id_request) async {
    
    await OrderProvider().getClientOrderDetailes(id_request).then((value) {

      

      final requestedDetailesModel = requestedDetailesModelFromJson(value);

      requesteDetail.value =
          requestedDetailesModel.result.requesteDetails.elementAt(0);

      // allRequests.clear();
      // allRequests.addAll(requestedModel.result.allRequests);
//requestedModel.result.requestedDetails.

      return '';
    });
  }

  createClientOrder() async {
    await OrderProvider()
        .createClientOrder(
            client_type: client_type,
            requested_type: requested_type,
            requested_state: requested_state,
            requested_title: requested_title.text,
            requested_description: requested_description.text)
        .then((value) {
      AppUtils().showSnackBar(
        title: appName,
        message: value,
        onstatusBarClosed: () {
     Get.toNamed(Routes.CLIENT, arguments: ["0"]);
        },
      );
    }, onError: (err) {
      AppUtils().showSnackBar(
        title: appName,
        message: err,
        onstatusBarClosed: () {},
      );
    });
  }
}
