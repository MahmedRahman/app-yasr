import 'package:get/get.dart';

import 'package:yasr/app/modules/debt/controllers/Debt_controller.dart';

class DebtBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DebtController>(
      () => DebtController(),
    );
  }
}
