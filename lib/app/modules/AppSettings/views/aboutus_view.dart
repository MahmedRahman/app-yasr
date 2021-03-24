import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/modules/AppSettings/controllers/app_settings_controller.dart';
import 'package:flutter_html/flutter_html.dart';

class AboutusView extends GetView<AppSettingsController> {
  @override
  Widget build(BuildContext context) {
    controller.getaboutPage();
    return Scaffold(
      appBar: AppBar(
        title: Text('من نحن'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.asset('assets/image/logo.png'),
          Center(
            child: Obx(() {
              return Html(
                data: controller.about.value,
              );
            }),
          ),
        ],
      ),
    );
  }
}
