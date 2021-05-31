import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/data/helper/AppConstant.dart';
import 'package:yasr/app/modules/order/controllers/order_controller.dart';
import 'package:yasr/app/modules/order/model/order_lawer_detailes.dart';
import 'package:yasr/app/modules/order_provider/controllers/order_provider_controller.dart';
import 'package:yasr/app/routes/app_pages.dart';
import 'package:yasr/app/data/helper/AppTheme.dart';
import 'package:yasr/app/data/component/CustomTextFormFiled.dart';
import 'package:yasr/app/services/auth.dart';

class LawyerOrderDetailView extends GetView {
  OrderProviderController controller = Get.put(OrderProviderController());

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('LawyerOrderDetailView'.tr),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: controller.getLawerRequestDetails(int.parse(data[0])),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              RequestedLawerDetailesModel requestedLawerDetailesModel =
                  snapshot.data;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      title: Text('اسم الطلب'),
                      subtitle: Text(requestedLawerDetailesModel
                          .result.requestDetails.first.requestedTitle),
                    ),
                    ListTile(
                      title: Text('تفاصيل الطلب'),
                      subtitle: Text(requestedLawerDetailesModel
                          .result.requestDetails.first.requestedDescription),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 64,
                              height: 64,
                              child: requestedLawerDetailesModel
                                          .result.listSlider.length ==
                                      0
                                  ? Container()
                                  : Image.network(requestedLawerDetailesModel
                                      .result.listSlider.first.imgLink),
                            ),
                            Icon(
                              Icons.play_circle_fill,
                              size: 64,
                              color: AppTheme().colorPrimary,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                    Text(
                      'تقديم عرض',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    CustomTextAreaFormFiled(
                      inputLabel: ' العرض',
                      inputHit: 'ادخال تفاصيل عرض للعميل',
                      inputController: controller.offer_title,
                    ),
                    CustomTextFormFiled(
                      inputLabel: 'قيمة العرض',
                      inputHit: 'ادخال عرض للعميل',
                      inputController: controller.offer_price,
                      keyboardType: TextInputType.number,
                      //inputController: ,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        //Get.toNamed(Routes.ChatView);

                        int clientPhone = int.parse(requestedLawerDetailesModel
                            .result.requestDetails.first.clientPhone);

                        UserServices user = Get.find();

                        int userPhone = int.parse(user.getPhoneNumber());

                        if (clientPhone < userPhone) {
                           RoomId =
                              '${clientPhone.toString()}${userPhone.toString()}';

                          Get.toNamed(Routes.ChatView);
                        } else {
                           RoomId =
                              '${userPhone.toString()}${clientPhone.toString()}';

                          Get.toNamed(Routes.ChatView);
                        }
                      },
                      child: Text('محادثة العميل'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        controller.addLawyerOffer(int.parse(data[0]));
                      },
                      child: Text('أرسال العرض'),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
