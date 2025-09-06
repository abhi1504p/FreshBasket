import 'package:get/get.dart';

class PickupLanguageController extends GetxController {
  /// Available languages
  final List<Map<String, String>> languageList = [
    {'title': 'English', 'value': 'en'},
    {'title': 'Hindi', 'value': 'hi'},
    {'title': 'Gujarati', 'value': 'gu'},
  ];

  /// Currently selected language
  final RxMap<String, String> selectedLanguage = {'title': 'English', 'value': 'en'}.obs;

  /// Update selected language
  void selectLanguage(Map<String, String> lang) {
    selectedLanguage.value = lang;
  }
}
