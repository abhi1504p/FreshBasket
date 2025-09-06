import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:freshbasket/common/common_extenstion.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

import '../../../common/globs.dart';

class AddressAddController extends GetxController {
  // Text controllers
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtAddress = TextEditingController();
  final TextEditingController txtCity = TextEditingController();
  final TextEditingController txtLatitude = TextEditingController();
  final TextEditingController txtLongitude = TextEditingController();
  final TextEditingController txtZipCode = TextEditingController();

  // State
  Rx<GeoPoint?> selectPin = Rx<GeoPoint?>(null);

  /// Initialize with existing data (for Edit case)
  void initData(Map? obj) {
    if (obj != null) {
      txtName.text = obj["name"] ?? "";
      txtAddress.text = obj["address"] ?? "";
      txtCity.text = obj["city"] ?? "";
      txtLatitude.text = obj["lati"] ?? "";
      txtLongitude.text = obj["longi"] ?? "";
      txtZipCode.text = obj["zip_code"] ?? "";

      if (txtLatitude.text.isNotEmpty && txtLongitude.text.isNotEmpty) {
        selectPin.value = GeoPoint(
          latitude: double.tryParse(txtLatitude.text) ?? 0.0,
          longitude: double.tryParse(txtLongitude.text) ?? 0.0,
        );
      }
    }
  }

  /// Pick location from map
  Future<void> pickLocation(BuildContext context) async {
    var p = await showSimplePickerLocation(
      context: context,
      isDismissible: true,
      title: "Location Picker",
      textConfirmPicker: "Pick",
      zoomOption: const ZoomOption(initZoom: 8),
      initPosition: selectPin.value,
      radius: 8.0,
    );

    if (p != null) {
      selectPin.value = p;
      txtLatitude.text = p.latitude.toString();
      txtLongitude.text = p.longitude.toString();

      List<Placemark> placemarks =
      await placemarkFromCoordinates(p.latitude, p.longitude);

      if (placemarks.isNotEmpty) {
        var aObj = placemarks.first;
        txtAddress.text =
        "${aObj.name}, ${aObj.street}, ${aObj.subLocality}";
        txtCity.text = "${aObj.subAdministrativeArea}";
        txtZipCode.text = aObj.postalCode ?? "";
      }
    }
  }

  /// Validate and return address object
  Map<String, dynamic>? validateAndGetData() {
    if (txtName.text.isEmpty) {
      _showError("Please enter name");
      return null;
    }
    if (txtAddress.text.isEmpty) {
      _showError("Please enter address");
      return null;
    }
    if (txtCity.text.isEmpty) {
      _showError("Please enter city name");
      return null;
    }
    if (txtZipCode.text.isEmpty) {
      _showError("Please enter zip code");
      return null;
    }
    if (selectPin.value == null) {
      _showError("Please select location on map");
      return null;
    }

    return {
      "name": txtName.text,
      "address": txtAddress.text,
      "city": txtCity.text,
      "zip_code": txtZipCode.text,
      "lati": txtLatitude.text,
      "longi": txtLongitude.text,
    };
  }

  void _showError(String msg) {
    mdShowAlert(Globs.appName, msg, () {});
  }
}
