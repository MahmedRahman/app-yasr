import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/modules/order/controllers/order_controller.dart';
import 'package:yasr/app/routes/app_pages.dart';
import 'package:yasr/app/data/helper/AppUtils.dart';
import 'package:yasr/app/data/component/CustomTextFormFiled.dart';

class OrderConfarmView extends GetView {
  TextEditingController paymentText = new TextEditingController();
  OrderController controller = Get.put(OrderController());
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
                keyboardType: TextInputType.number,
                inputController: paymentText,
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();

                  controller.chose_lawyer(
                      Get.arguments[0], Get.arguments[1], paymentText.text);
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
