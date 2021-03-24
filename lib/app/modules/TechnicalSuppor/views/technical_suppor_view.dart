import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/modules/TechnicalSuppor/controllers/technical_suppor_controller.dart';
import 'package:yasr/app/modules/TechnicalSuppor/model/ticketsModel.dart';
import 'package:yasr/app/routes/app_pages.dart';
import 'package:yasr/app/utils/AppTheme.dart';

class TechnicalSupporView extends GetView<TechnicalSupporController> {
  @override
  Widget build(BuildContext context) {

    controller.getTickets();
    return Scaffold(
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Get.toNamed(Routes.TechnicalSupportCreateView);
            },
            child: Container(
              width: 150,
              height: 150,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme().colorPrimary,
                borderRadius: BorderRadius.circular(75),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'انشاء طلب دعم فنى',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Obx(
            () {
              //  return Text(controller?.myTickets?.length.toString());
              return Expanded(
                child: ListView.builder(
                  itemCount: controller?.myTickets?.length ?? 0,
                  itemBuilder: (context, index) {
                    MyTicket myTicket = controller.myTickets.elementAt(index);

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: ListTile(
                          onTap: () {
                            Get.toNamed(Routes.ChatView);
                          },
                          title: Text(myTicket.title),
                          subtitle: Text('تم الحل'),
                          leading: Container(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              myTicket.type,
                              style: TextStyle(color: Colors.white),
                            ),
                            decoration:
                                BoxDecoration(color: AppTheme().colorPrimary),
                          ),
                          trailing: Text(
                            DateFormat("MMMM d")
                                .format(myTicket.createdAt)
                                .toString(),
                            style: TextStyle(
                                color: AppTheme().colorPrimary,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          /* Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller?.myTickets?.length ?? 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          Get.toNamed(Routes.ChatView);
                        },
                        title:
                            Text(controller.myTickets.elementAt(index).title),
                        subtitle: Text('تم الحل'),
                        leading: Container(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            'مشكلة',
                            style: TextStyle(color: Colors.white),
                          ),
                          decoration:
                              BoxDecoration(color: AppTheme().colorPrimary),
                        ),
                        trailing: Text(
                          controller.myTickets
                              .elementAt(index)
                              .createdAt
                              .toString(),
                          style: TextStyle(
                              color: AppTheme().colorPrimary,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),*/
        ],
      ),
    );
  }
}
