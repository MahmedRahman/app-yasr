import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/utils/AppConstant.dart';
import 'package:yasr/app/utils/AppUtils.dart';
import 'package:yasr/app/widget/CustomCheckBox.dart';

class PermissionsEditView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            onPressed: () {
              AppUtils().showSnackBar( title: appName, message: 'تم', onstatusBarClosed: () {              
                  Get.back();
              });
            },
            child: Text('حفظ الصلاحيات'),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('PermissionsEditView'.tr),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                ListTile(
                  title: Text('اسم الطلب'),
                  subtitle: Text('رقم صاحب القضي'),
                  trailing: Text('10/10/2020'),
                  leading: SizedBox(
                    width: 32,
                    height: 32,
                    child: Image.asset('assets/image/order.png'),
                  ),
                ),
                CustomCheckBox(
                  labelCheckBox: 'الاطلاع على ملف القضية',
                ),
                CustomCheckBox(
                  labelCheckBox: 'تعديل ملف القضية',
                )
              ],
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
