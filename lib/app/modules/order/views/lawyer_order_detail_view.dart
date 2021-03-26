import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/routes/app_pages.dart';
import 'package:yasr/app/data/helper/AppTheme.dart';
import 'package:yasr/app/data/component/CustomTextFormFiled.dart';

class LawyerOrderDetailView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LawyerOrderDetailView'.tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text('اسم الطلب'),
              subtitle: Text('اسم الطلب'),
            ),
            ListTile(
              title: Text('تفاصيل الطلب'),
              subtitle: Text(
                  'تفاصيل القضية او الاستشارة القانونية تفاصيل القضية او الاستشارة القانونية تفاصيل القضية او الاستشارة القانونية تفاصيل القضية او الاستشارة القانونية '),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 64,
                      height: 64,
                      child: Image.network('https://picsum.photos/64/64'),
                    ),
                    Icon(
                      Icons.play_circle_fill,
                      size: 64,
                      color: AppTheme().colorPrimary,
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 2,
            ),
            Text(
              'تقديم عرض',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            CustomTextFormFiled(
              inputLabel: 'عنوان العرض',
              inputHit: 'ادخال عرض للعميل',
            ),
            CustomTextAreaFormFiled(
              inputLabel: 'تفاصيل العرض',
              inputHit: 'ادخال تفاصيل عرض للعميل',
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                Get.toNamed(Routes.ChatView);
              },
              child: Text('محادثة العميل'),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
