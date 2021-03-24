import 'package:get/get.dart';

import 'package:yasr/app/modules/lawyer/controllers/lawyer_controller.dart';

class LawyerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LawyerController>(
      () => LawyerController(),
    );
  }
}
