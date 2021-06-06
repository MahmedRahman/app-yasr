import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yasr/app/data/helper/AppConstant.dart';
import 'package:yasr/app/modules/order/controllers/order_controller.dart';
import 'package:yasr/app/modules/order/model/order_detailes_model.dart';
import 'package:yasr/app/modules/order/views/order_offer_view.dart';
import 'package:yasr/app/routes/app_pages.dart';
import 'package:yasr/app/data/helper/AppTheme.dart';
import 'package:yasr/app/data/component/CustomCheckBox.dart';

class OrderDetailsView extends GetView<OrderController> {
  var lawerid = '';
  var requestid = Get.arguments[0];
  var selectflg = true.obs;

  @override
  Widget build(BuildContext context) {
    controller.getClientOrderDetailes(requestid);

    var Checkboxvalue = false.obs;

    return Scaffold(
      appBar: AppBar(
        title: Text('تفاصيل الطلب'),
        centerTitle: true,
      ),
      body: GetX<OrderController>(builder: (builder) {
        return FutureBuilder(
            future: controller.requesteDetail.value,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                RequestedDetailesModel requeste = snapshot.data;
                return Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'عنوان الطلب',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          requeste.result.requestDetails.first.requestedTitle
                              .toString(),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'تفاصيل الطلب',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          requeste
                              .result.requestDetails.first.requestedDescription
                              .toString(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 2,
                        ),
                        Text(
                          'عروض على الطلب',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: requeste.result.lawyersList.length == 0
                              ? Center(
                                  child: Container(
                                    child: Text(
                                      'لا يوجد عروض مقدمة',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              : ListView.separated(
                                  itemCount: requeste.result.lawyersList.length,
                                  itemBuilder: (context, index) {
                                    LawyersList lawyersList = requeste
                                        .result.lawyersList
                                        .elementAt(index);

                                    return Card(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: ListTile(
                                              onTap: () {
                                                Get.to(OrderOfferView(),
                                                    arguments: [
                                                      requeste
                                                          .result
                                                          .requestDetails
                                                          .first
                                                          .requestedId,
                                                      lawyersList.idLawyer,
                                                      requeste
                                                          .result
                                                          .requestDetails
                                                          .first
                                                          .clientPhone
                                                    ]);
                                              },
                                              title: Text(
                                                lawyersList.lawyerName,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      AppTheme().colorPrimary,
                                                ),
                                              ),
                                              subtitle: Text(
                                                lawyersList.offerDate,
                                                style: TextStyle(
                                                  color:
                                                      AppTheme().colorPrimary,
                                                ),
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                              icon: Icon(lawerid.toString() ==
                                                      lawyersList.idLawyer.toString()
                                                  ? Icons.done
                                                  : Icons.cached),
                                              onPressed: () {

                                               print(lawerid.toString());
                                               print(lawyersList.idLawyer.toString());
                                                lawerid = lawyersList.idLawyer;
                                                //Checkboxvalue.value = value;
                                              })
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return Divider(
                                      thickness: 1,
                                    );
                                  },
                                ),
                        ),
                        RaisedButton(
                          onPressed: () {
                            if (lawerid.isEmpty) {
                              Get.snackbar(appName, 'برجاء اختيار المحامى');
                            } else {
                              Get.defaultDialog(
                                  title: 'اختيار محامى',
                                  content: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'اتعهد بدفع عمولة المنصة 1.5% من مجموع قيمة الاتعاب المستحقة للمحامي',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: AppTheme().colorPrimary,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        CustomCheckBox(
                                          labelCheckBox: 'أوافق على التعهد',
                                        ),
                                        RaisedButton(
                                          onPressed: () {
                                            Get.toNamed(Routes.OrderConfarmView,
                                                arguments: [
                                                  requestid,
                                                  lawerid.toString()
                                                ]);
                                            //  Get.back();
                                          },
                                          child: Text('تأكيد المحامى'),
                                        )
                                      ],
                                    ),
                                  ));
                            }
                          },
                          child: Text('اختار محامى'),
                        )
                      ],
                    ),
                  ),
                );
              }
              if (snapshot.hasError) {
                return Center(child: Text('خطاء فى الدتا'));
              }
              return Center(child: CircularProgressIndicator());
            });
      }),
    );
  }
}
