import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasr/app/modules/order/controllers/order_controller.dart';
import 'package:yasr/app/routes/app_pages.dart';
import 'package:yasr/app/utils/AppTheme.dart';
import 'package:yasr/app/widget/CustomCheckBox.dart';

class OrderDetailsView extends GetView<OrderController> {
  @override
  Widget build(BuildContext context) {
    controller.getClientOrderDetailes(Get.arguments[0]);
    return Obx(
       () {
        return Scaffold(
          appBar: AppBar(
            title: Text(controller.requesteDetail.value.requestedTitle),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  controller.requesteDetail.value.requestedTitle,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'تفاصيل الطلب',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                 controller.requesteDetail.value.requestedDescription,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Divider(
                  color: Colors.black,
                  thickness: 3,
                ),
                Text(
                  'عروض على االطلب',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                    child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: (){
                        Get.toNamed(Routes.ChatView);
                      },
                      title: Text(
                        'اسم المحامى',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppTheme().colorPrimary),
                      ),
                      subtitle: Text(
                        'عرض المقدم من المحامى',
                        style: TextStyle(color: AppTheme().colorPrimary),
                      ),
                      trailing: Text('data'),
                      /*
                      CustomSwitch(
                        activeColor: AppTheme().colorPrimary,
                        value: false,
                        onChanged: (value) {
                          // status = value;
                        },
                      ),
                      */
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      thickness: 1,
                    );
                  },
                )),
                RaisedButton(
                  onPressed: () {
                    Get.defaultDialog(
                        title: 'اختيار محامى',
                        content: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'اتعهد بدفع عمولة المنصة 1.5% من مجموع قيمة الاتعاب المستحقة للمحامي',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppTheme().colorPrimary,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              CustomCheckBox(
                                labelCheckBox: 'أوافق على التعهد',
                              ),
                              RaisedButton(onPressed: (){
                                Get.back();
                                Get.toNamed(Routes.OrderConfarmView);
                              },child: Text('تأكيد المحامى'),)
                            ],
                          ),
                        ));
                  },
                  child: Text('اختار محامى'),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
