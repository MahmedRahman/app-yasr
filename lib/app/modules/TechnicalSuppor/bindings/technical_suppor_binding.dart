import 'package:get/get.dart';
import 'package:yasr/app/modules/technicalsuppor/controllers/technical_suppor_controller.dart';


class TechnicalSupporBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TechnicalSupporController>(
      () => TechnicalSupporController(),
    );
  }
}
