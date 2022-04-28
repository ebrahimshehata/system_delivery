import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController
{
  GetStorage boxStorage = GetStorage();
  String key = 'isDarkMode';

  saveChangeTheme(bool isDark)
  {
    boxStorage.write(key, isDark);
  }

  bool getChangeTheme()
  {
    return boxStorage.read<bool>(key) ?? false;
  }

    ThemeMode get themeChange
  {
    return  getChangeTheme() ? ThemeMode.dark : ThemeMode.light ;
  }

  void changeTheme()
  {
    Get.changeThemeMode(
        getChangeTheme()
            ? ThemeMode.light
            : ThemeMode.dark
    );

    saveChangeTheme (!getChangeTheme());
  }
}