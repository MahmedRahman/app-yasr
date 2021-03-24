import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/modules/TechnicalSuppor/controllers/technical_suppor_controller.dart';
import 'package:yasr/app/utils/AppEnumeration.dart';
import 'package:yasr/app/widget/CustemDropdownButton.dart';
import 'package:yasr/app/widget/CustomTextFormFiled.dart';

class TechnicalSupportCreateView extends GetView<TechnicalSupporController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('أنشاء طلب دعم فنى'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              CustomDropdownButton(
                listDropdown: ListTicketsTypes.map((e) => e['name'].toString()).toList(),
                listDropdownValue: ListTicketsTypes.map((e) =>int.parse(e['id'].toString())).toList(),
                labelDropdownButton: 'اختار نوع الطلب',
                onChanged: (value){
                
                  controller.ticketId =  value.toString();
                },
              ),
              CustomTextFormFiled(
                inputLabel: 'عنوان الطلب',
                inputHit: 'ادخل عنوان الطلب',
                inputController: controller.title,
                keyboardType: TextInputType.name,
              ),
              CustomTextAreaFormFiled(
                inputLabel: 'تفاصيل الطلب',
                inputHit: 'ادخل تفاصيل الطلب',
                inputController: controller.content,
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                   FocusScope.of(context).unfocus();
                  if (_formKey.currentState.validate()) {
                   
                    controller.createTickets();
                  };
                },
                child: Text('send'.tr),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
