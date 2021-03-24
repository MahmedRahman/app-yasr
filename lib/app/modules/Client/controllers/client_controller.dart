import 'package:get/get.dart';

class ClientController extends GetxController {
  //TODO: Implement ClientController
  
 var pageIndex = 0.obs;

  @override
  void setPageIndex(int index) {
    pageIndex.value = index;
  }

  @override
  void onReady() {}

  @override
  void onClose() {}


  
}
