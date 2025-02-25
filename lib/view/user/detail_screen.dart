import 'package:flutter/material.dart';
import 'package:recipeapp/constants/app_images.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * .05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * .09,
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    height: screenHeight * .23,
                    width: screenWidth * .85,
                    fit: BoxFit.cover,
                    AppImages.dummyImage1,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * .03,
                ),
                child: Divider(),
              ),
              Text(
                'Cacao Maca Wainut Milk',
                style: theme.textTheme.headlineMedium,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * .03,
                ),
                child: Divider(),
              ),
              Text(
                'Description',
                style: theme.textTheme.headlineMedium,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * .02),
                child: Text(
                  'your recipies are vary famous you can use it in your daily meals like brakefast etc',
                  style: theme.textTheme.bodySmall,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
