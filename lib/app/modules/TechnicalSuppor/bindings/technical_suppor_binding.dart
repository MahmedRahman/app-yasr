import 'package:get/get.dart';
import 'package:yasr/app/modules/TechnicalSuppor/controllers/technical_suppor_controller.dart';


class TechnicalSupporBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TechnicalSupporController>(
      () => TechnicalSupporController(),
    );
  }
}
