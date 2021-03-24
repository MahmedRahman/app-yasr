import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/modules/Notifications/model/notifications_model.dart'; 

class NotificationsDetailesView extends GetView {

 



  @override
  Widget build(BuildContext context) {
    print(Get.arguments[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text('تفاصيل التنبيه'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(Get.arguments[0]),
            subtitle: Text(Get.arguments[1]),
          ),
          Text(Get.arguments[2])
        ],
      ),
    );
  }
}
  