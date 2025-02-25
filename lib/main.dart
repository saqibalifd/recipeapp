import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/firebase_options.dart';
import 'package:recipeapp/theme/theme_data.dart';
import 'package:recipeapp/view/auth/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Recipies app',
        darkTheme: AppTheme.darkTheme,
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: OnBoardingScreen());
  }
}
