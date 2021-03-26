//import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/data/helper/AppTheme.dart';
import 'package:yasr/app/data/component/CustomTextFormFiled.dart';

class PermissionsAddView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PermissionsAddView'.tr),
          centerTitle: true,
        ),
        body: Column(
          children: [
            CustomTextFormFiled(
              inputHit: 'ادخال اسم المحامى',
              inputLabel: 'أسم المحامى',
            ),
            CustomTextFormFiled(
              inputHit: 'رقم جوال المحامي',
              inputLabel: 'جوال المحامى',
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'صلاحيات المحامي',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.end,
            ),
            ListTile(
              title: Text('الاطلاع على ملف القضية'),
              trailing: Text('data')
              /*
              CustomSwitch(
                activeColor: AppTheme().colorPrimary,
                value: false,
                onChanged: (value) {
                  // status = value;
                },
              ),
*/
            ),
            Divider(
              color: Colors.black,
              thickness: 2,
            ),
            ListTile(
              title: Text('تعديل ملفات القضية'),
              trailing:Text('data')
              
              /* CustomSwitch(
                activeColor: AppTheme().colorPrimary,
                value: false,
                onChanged: (value) {
                  // status = value;
                },
              ),*/
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('إضافة محامى'),
            )
          ],
        ));
  }
}
