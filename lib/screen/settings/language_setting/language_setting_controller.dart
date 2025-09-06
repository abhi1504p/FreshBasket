import 'package:get/get.dart';

class LanguageSettingController extends GetxController {
  /// Default selected language
  final RxString selectedLanguage = "English (United States)".obs;

  /// Update selected language
  void updateLanguage(String newLanguage) {
    selectedLanguage.value = newLanguage;
  }
}
