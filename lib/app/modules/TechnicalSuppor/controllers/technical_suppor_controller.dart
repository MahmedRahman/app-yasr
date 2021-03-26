import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yasr/app/modules/TechnicalSuppor/model/ticketsModel.dart';
import 'package:yasr/app/modules/TechnicalSuppor/provider/technical_suppor_provider.dart';
import 'package:yasr/app/routes/app_pages.dart';
import 'package:yasr/app/data/helper/AppConstant.dart';
import 'package:yasr/app/data/helper/AppUtils.dart';

class TechnicalSupporController extends GetxController {
  List<MyTicket> myTickets;
  TextEditingController title = new TextEditingController();
  TextEditingController content = new TextEditingController();
  String ticketId;

  @override
  void onInit() {
    print('TechnicalSuppor Init');
    myTickets = List<MyTicket>().obs;
    
    super.onInit();
  }

  @override
  void onReady() {
    print('TechnicalSuppor onReady');

    super.onReady();
  }

  Future createTickets() async {
    await TechnicalSupporProvider()
        .createTickets(
      tickettypeid: ticketId,
      title: title.text,
      content: content.text,
    )
        .then((value) {


          print(value);

      AppUtils().showSnackBar(
          title: appName,
          message: value.toString(),
          onstatusBarClosed:  (){
            title.clear();
            content.clear();
//getTickets();
            Get.toNamed(Routes.CLIENT, arguments: ["1"]);


          });
    }, onError: (value) {
      AppUtils().showSnackBar(
        onstatusBarClosed: () {},
        title: appName,
        message: value,
      );
    });
  }

  getTickets() {
    print('TechnicalSuppor Start Get Ticket');
    TechnicalSupporProvider().getTickets().then((value) {
      final ticketsModel = ticketsModelFromJson(value);
myTickets.clear();
      myTickets.addAll(ticketsModel.result.myTickets);
    }, onError: (value) {
      AppUtils().showSnackBar(
          onstatusBarClosed: () {}, title: appName, message: value);
    });
  }

  @override
  void onClose() {
    print('TechnicalSuppor Close');
    // TODO: implement onClose
    super.onClose();
  }
}
