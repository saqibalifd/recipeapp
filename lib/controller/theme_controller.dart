import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    isDarkMode.value = _box.read('isDarkMode') ?? false;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void switchTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    _box.write('isDarkMode', isDarkMode.value); // Store theme state
  }
}
