import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/modules/Debt/controllers/Debt_controller.dart';
import 'package:yasr/app/utils/AppTheme.dart';
import 'package:yasr/app/utils/AppUtils.dart';
import 'package:yasr/app/widget/CustomTextFormFiled.dart';

class DebtView extends GetView<DebtController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              ListTile(
                isThreeLine: true,
                title: Text(
                  'اسم الطلب',
                  style: TextStyle(
                      color: AppTheme().colorPrimary,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text('اسم ألمحامى'),
                trailing: Text(
                  '10/10/2020',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppTheme().colorPrimary,
                  ),
                ),
                leading: SizedBox(
                  height: 32,
                  width: 32,
                  child: Image.asset('assets/image/order.png'),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width / 1.5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomTextFormFiled(
                        inputHit: 'ادخال اجمالى المبلغ ',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color: AppTheme().colorPrimary,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'احسب',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'PNU',
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width / 1.5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomTextFormFiled(
                        inputHit: 'ادخال نسبة العمولة ',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color: AppTheme().colorPrimary,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'ادفع',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'PNU',
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.black,
          thickness: 1,
        );
      },
    ));
  }
}
