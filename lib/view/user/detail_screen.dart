import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/models/recipies_model.dart';

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

    final RecipeModel argument = Get.arguments;
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
                  child: Image.network(
                    height: screenHeight * .23,
                    width: screenWidth * .85,
                    fit: BoxFit.cover,
                    argument.image,
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
                argument.title,
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
                  argument.description,
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
