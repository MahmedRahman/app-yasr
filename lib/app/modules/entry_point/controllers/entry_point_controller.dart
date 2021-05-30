import 'package:get/get.dart';
import 'package:yasr/app/api/web_serives.dart';
import 'package:yasr/app/routes/app_pages.dart';
import 'package:yasr/app/services/auth.dart';

class EntryPointController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    print('How Ary You');

   //await WebServices().smsConfirm(phone: 'phone', activationCode: 'activationCode', userType: 0);

    Future.delayed(Duration(seconds: 2), () {
      if (Get.find<UserServices>().getUserRole() == '1') {
        Get.toNamed(Routes.LAWYER);
      } else if (Get.find<UserServices>().getUserRole() == '0') {
        Get.toNamed(Routes.CLIENT);
      } else {
        Get.toNamed(Routes.UserTypeView);
      }
    });

    super.onInit();
  }
}
