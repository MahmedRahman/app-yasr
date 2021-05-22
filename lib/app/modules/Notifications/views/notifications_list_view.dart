import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/modules/Notifications/controllers/notifications_controller.dart';
import 'package:yasr/app/modules/Notifications/model/notifications_model.dart';
import 'package:yasr/app/routes/app_pages.dart';
import 'package:yasr/app/data/helper/AppTheme.dart';

class NotificationsListView extends GetView<NotificationsController> {
  NotificationsController _notificationsController =
      Get.put<NotificationsController>(NotificationsController());

  @override
  Widget build(BuildContext context) {
    _notificationsController.getNotifaction();
    return Scaffold(
        appBar: AppBar(
          title: Text('التنبيهات'),
          centerTitle: true,
        ),
        body: Obx(() {
          return FutureBuilder(
              future: _notificationsController.allNotifications.value,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<AllNotification> allNotifications = snapshot.data;
                  print(allNotifications.length);

                 return allNotifications.length ==0 ? Center(
                   child: Text('لا يوجد تنبيهات' ,style: TextStyle(
                     fontWeight: FontWeight.bold
                   ),),
                 )  :
                   ListView.builder(
                    itemCount: allNotifications
                        .length, //controller.allNotifications.length,
                    itemBuilder: (context, index) {
                      AllNotification notification =
                          allNotifications.elementAt(index);

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 2,
                          child: ListTile(
                            onTap: () {
                              Get.toNamed(Routes.NotificationsDetailesView,
                                  arguments: [
                                    notification.title,
                                    notification.createdAt.toString(),
                                    notification.body
                                  ]);
                            },
                            title: Text(
                              notification.title,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              notification.createdAt.toString(),
                              style: TextStyle(color: Colors.green),
                            ),
                            leading: Icon(
                              Icons.notifications_active,
                              size: 32,
                              color: AppTheme().colorPrimary,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              });
        }));
  }
}
