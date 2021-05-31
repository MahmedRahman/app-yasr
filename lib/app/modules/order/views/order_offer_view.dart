import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/data/helper/AppConstant.dart';
import 'package:yasr/app/data/helper/AppUtils.dart';
import 'package:yasr/app/modules/order/controllers/order_controller.dart';
import 'package:yasr/app/modules/order/model/offer_detailes.dart';
import 'package:yasr/app/routes/app_pages.dart';

class OrderOfferView extends GetView {
  OrderController controller = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('تفاصيل عرض المحامى'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future:
              controller.OfferDetailes(int.parse(data[0]), int.parse(data[1])),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              RequestedOfferModel requestedOfferModel = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'تفاصيل الطلب',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      requestedOfferModel
                          .result.requestDetails.first.requestedTitle,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      requestedOfferModel
                          .result.requestDetails.first.requestedDate
                          .toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      requestedOfferModel
                          .result.requestDetails.first.requestedDescription,
                      //requeste.result.requestDetails.first.requestedDescription
                      //  .toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 3,
                    ),
                    Text(
                      'تفاصيل العرض',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'أسم المحامى',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        requestedOfferModel.result.lawyersList.lawyerName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'تاريخ العرض',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        requestedOfferModel.result.lawyersList.offerDate
                            .toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'تفاصيل العرض',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        requestedOfferModel.result.lawyersList.lawyerOffer,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      onPressed: () {
                        FocusScope.of(context).requestFocus(new FocusNode());

                        Get.snackbar('title',
                            '${requestedOfferModel.result.lawyersList.lawyerPhone} ${data[2]}');

                        print(
                            '${requestedOfferModel.result.lawyersList.lawyerPhone} ${data[2]}');

                        int clientPhone = int.parse(data[2]);

                        int userPhone = int.parse(
                            requestedOfferModel.result.lawyersList.lawyerPhone);

                        if (clientPhone < userPhone) {
                          RoomId =
                              '${clientPhone.toString()}${userPhone.toString()}';
                        } else {
                          RoomId =
                              '${userPhone.toString()}${clientPhone.toString()}';
                        }

                        Get.toNamed(Routes.ChatView);

//                        Get.toNamed(Routes.ChatView);
                      },
                      child: Text('محادثة مع المحامى'),
                      elevation: 2,
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
