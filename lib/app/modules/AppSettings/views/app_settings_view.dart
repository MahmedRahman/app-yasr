import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/modules/AppSettings/controllers/app_settings_controller.dart'; 

class AppSettingsView extends GetView<AppSettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppSettingsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AppSettingsView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  