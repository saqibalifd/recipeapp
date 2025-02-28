import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/constants/app_icons.dart';
import 'package:recipeapp/constants/app_images.dart';
import 'package:recipeapp/view/user/home_screen.dart';
import 'package:recipeapp/widgets/field/custom_textfield_widget.dart';

class AddRecipieScreen extends StatefulWidget {
  const AddRecipieScreen({super.key});

  @override
  State<AddRecipieScreen> createState() => _AddRecipieScreenState();
}

class _AddRecipieScreenState extends State<AddRecipieScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * .05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight * .1,
              ),
              Stack(
                children: [
                  Container(
                      height: screenHeight * .2,
                      width: screenWidth * .9,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(8)),
                      child: Image.asset(
                        AppImages.dummyImage2,
                        fit: BoxFit.cover,
                      )),
                  Container(
                    height: screenHeight * .2,
                    width: screenWidth * .9,
                    decoration: BoxDecoration(
                        color: theme.primaryColor.withOpacity(.5),
                        borderRadius: BorderRadius.circular(8)),
                    child: Icon(
                      AppIcons.addImage,
                      size: 70,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * .1,
              ),
              CustomTextField(
                  textEditingController: nameController, hint: 'Recipie Name'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * .01),
                child: CustomTextField(
                    textEditingController: nameController,
                    hint: 'Recipie Detail'),
              ),
              CustomTextField(
                  textEditingController: nameController,
                  hint: 'Recipie Category'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * .01),
                child: CustomTextField(
                    textEditingController: nameController,
                    hint: 'Recipie Time'),
              ),
              SizedBox(
                height: screenHeight * .1,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    minimumSize:
                        WidgetStatePropertyAll(Size(screenWidth / 1.2, 80)),
                  ),
                  onPressed: () async {
                    Get.offAll(() => HomeScreen());
                  },
                  child: Text('Upload'))
            ],
          ),
        ),
      ),
    );
  }
}
