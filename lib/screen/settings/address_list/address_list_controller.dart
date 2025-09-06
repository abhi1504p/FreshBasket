import 'package:get/get.dart';

class AddressController extends GetxController {
  /// Observable list of addresses
  RxList<Map<String, dynamic>> addressArr = <Map<String, dynamic>>[].obs;

  /// Add new address
  void addAddress(Map<String, dynamic> newAddress) {
    addressArr.add(newAddress);
  }

  /// Update existing address
  void updateAddress(int index, Map<String, dynamic> updatedAddress) {
    if (index >= 0 && index < addressArr.length) {
      addressArr[index] = updatedAddress;
    }
  }

  /// Delete address
  void deleteAddress(int index) {
    if (index >= 0 && index < addressArr.length) {
      addressArr.removeAt(index);
    }
  }
}
