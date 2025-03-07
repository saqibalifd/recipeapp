import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/constants/app_images.dart';
import 'package:recipeapp/view/user/home_screen.dart';
import 'package:recipeapp/widgets/button/custom_button_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.onBoardingDish),
            SizedBox(
              height: screenHeight / 5,
            ),
            Text(
              'Start Cooking',
              style: theme.textTheme.headlineLarge,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight / 60,
                bottom: screenHeight / 20,
              ),
              child: Text(
                textAlign: TextAlign.center,
                'Let’s join our community to cook better food!',
                style: theme.textTheme.bodyMedium,
              ),
            ),
            CustomButton(
              text: 'Get Started',
              onPressed: () async {
                Get.offAll(() => HomeScreen());
              },
            )
          ],
        ),
      ),
    );
  }
}
