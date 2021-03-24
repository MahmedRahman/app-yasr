import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:yasr/app/modules/AppSettings/controllers/app_settings_controller.dart';

class UsagepolicyView extends GetView<AppSettingsController> {
  @override
  Widget build(BuildContext context) {
    controller.getTermsConditionsPage();
    return Scaffold(
      appBar: AppBar(
        title: Text('سياسة الاستخدام'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() {
          return Html(
            data: controller.termsConditions.value,
          );
        }),
      ),
    );
  }
}
