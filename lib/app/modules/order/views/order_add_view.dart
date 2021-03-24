import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/modules/order/controllers/order_controller.dart';
import 'package:yasr/app/utils/AppEnumeration.dart';
import 'package:yasr/app/utils/AppTheme.dart';
import 'package:yasr/app/utils/AppUtils.dart';
import 'package:yasr/app/utils/AppValidation.dart';
import 'package:yasr/app/widget/CustemDropdownButton.dart';
import 'package:yasr/app/widget/CustomCheckBox.dart';
import 'package:yasr/app/widget/CustomTextFormFiled.dart';

class OrderAddView extends GetView<OrderController> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OrderAddView'.tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomDropdownButton(
                  listDropdown:
                      ListOrderClientTypes.map((e) => e['name'].toString())
                          .toList(),
                  listDropdownValue: ListOrderClientTypes.map(
                      (e) => int.parse(e['id'].toString())).toList(),
                  labelDropdownButton: 'نوع العميل',
                  onChanged: (value) {
                   
                    controller.client_type = value;
                  },
                ),
                CustomDropdownButton(
                  listDropdown:
                      ListRequest.map((e) => e['request_name'].toString())
                          .toList(),
                  listDropdownValue: ListRequest.map(
                      (e) => int.parse(e['request_id'].toString())).toList(),
                  labelDropdownButton: 'نوع الطلب',
                  onChanged: (value){
                      controller.requested_type = value;
                  },
                ),
                CustomDropdownButton(
                  listDropdown:
                      ListCity.map((e) => e['state_name'].toString()).toList(),
                  listDropdownValue:
                      ListCity.map((e) => int.parse(e['state_id'].toString()))
                          .toList(),
                  labelDropdownButton: 'مكان القضية',
                  onChanged: (value){
                    controller.requested_state = value;
                  },
                ),
                CustomTextFormFiled(
                  inputLabel: 'عنوان الطلب',
                  inputHit: 'ادخال عنوان الطلب',
                  onValidator: (value) {
                    return AppValidation.checkEmpty(value);
                  },
                  inputController: controller.requested_title,
                ),
                CustomTextAreaFormFiled(
                  inputLabel: 'تفاصيل الطلب',
                  inputHit: 'ادخال تفاصيل الطلب',
                  inputController: controller.requested_description,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                  child: Row(
                    children: [
                      InkWell(
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: Image.asset('assets/image/imageupload.png'),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: Image.asset('assets/image/soundrecord.png'),
                        ),
                      )
                    ],
                  ),
                ),
                CustomCheckBox(
                  labelCheckBox: 'تحديد متوسط سعر تقريبي للخدمة المقدمة',
                ),
                RaisedButton(
                  onPressed: () {
                       FocusScope.of(context).requestFocus(new FocusNode());
                    if (_formKey.currentState.validate()) {
                      controller.createClientOrder();
                    }
                  },
                  child: Text('ارسال الطلب'),
                  elevation: 2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
