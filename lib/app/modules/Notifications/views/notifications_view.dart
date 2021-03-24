import 'package:get/get.dart'; 
import 'package:flutter/material.dart';
import 'package:yasr/app/modules/Notifications/controllers/Notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotificationsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'NotificationsView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  