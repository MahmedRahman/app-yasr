import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/modules/permissions/controllers/permissions_controller.dart';
import 'package:yasr/app/routes/app_pages.dart';
import 'package:yasr/app/utils/AppTheme.dart';

class PermissionsView extends GetView<PermissionsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PermissionsView'.tr),
        centerTitle: true,
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Get.toNamed(Routes.PermissionsAddView);
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
                  'اضافة محامى جديد',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      onTap: (){
                        Get.toNamed(Routes.PermissionsEditView);
                      },
                      title: Text('اسم المحامى'),
                      subtitle: Row(
                        children: [
                          Text('الصلاحيات'),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'اطلاع',
                            style: TextStyle(color: Colors.green ,fontWeight: FontWeight.bold),
                          ),
                            SizedBox(
                            width: 5,
                          ),
                          Text(
                            'تعديل',
                            style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      trailing: Text(
                        '2020-12-16',
                        style: TextStyle(
                            color: AppTheme().colorPrimary,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
