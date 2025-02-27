import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:recipeapp/controller/theme_controller.dart';
import 'package:recipeapp/firebase_options.dart';
import 'package:recipeapp/theme/theme_data.dart';
import 'package:recipeapp/view/auth/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeController themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Recipies app',
        darkTheme: AppTheme.darkTheme,
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: OnBoardingScreen());
  }
}
