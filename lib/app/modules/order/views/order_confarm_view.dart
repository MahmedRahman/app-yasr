import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/routes/app_pages.dart';
import 'package:yasr/app/utils/AppUtils.dart';
import 'package:yasr/app/widget/CustomTextFormFiled.dart';

class OrderConfarmView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OrderConfarmView'.tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'برجاء ادخال اجمالى قيمة الاتعاب المتفق عليها',
                style: TextStyle(fontSize: 20),
              ),
              CustomTextFormFiled(
                inputLabel: 'قيمة اجر المحامى',
                inputHit: 'ادخال أجمالي قيمة اجر المحامى ',
              ),
              CustomTextAreaFormFiled(
                inputHit: 'برجاء كتابة تفاصيل اكثر بخصوص اجر المحامى',
                inputLabel: 'تفاصيل ',
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {
                  AppUtils().showSnackBar(
                      title: '',
                      message: '',
                      onstatusBarClosed: () {
                        Get.toNamed(Routes.CLIENT);
                      });
                },
                child: Text('تأكيد المحامى'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
