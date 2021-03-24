import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

const KuserToken = 'usertoken';
const KuserRole = 'userRole';
const KfullName = 'fullName';
const KphoneNumber = 'phoneNumber';

class UserServices extends GetxService {


  GetStorage storage = GetStorage();

  void setUserToken(String value) {
    storage.write(KuserToken, value);
  }

  void setUserRole(String value) {
    storage.write(KuserRole, value);
  }

  void setfullName(String value) {
    storage.write(KfullName, value);
  }

  void setphoneNumber(String value) {
    storage.write(KphoneNumber, value);
  }

  String getUserToken() {
    return storage.read(KuserToken);
  }

  String getUserRole() {
    return storage.read(KuserRole);
  }

  String getFullName() {
    return storage.read(KfullName);
  }

  String getPhoneNumber() {
    return storage.read(KphoneNumber);
  }
}
