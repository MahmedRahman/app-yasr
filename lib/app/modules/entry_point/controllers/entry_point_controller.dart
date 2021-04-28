import 'package:get/get.dart';
import 'package:yasr/app/routes/app_pages.dart';
import 'package:yasr/app/services/auth.dart';

class EntryPointController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    print('How Ary You');

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
