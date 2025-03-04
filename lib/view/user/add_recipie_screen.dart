import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/constants/app_icons.dart';
import 'package:recipeapp/controller/recipies_controller.dart';
import 'package:recipeapp/widgets/button/custom_button_widget.dart';
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
  final RecipiesController recipiesController = Get.put(RecipiesController());

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
                          recipiesController.slectedImage.toString())),
                  Container(
                      height: screenHeight * .2,
                      width: screenWidth * .9,
                      decoration: BoxDecoration(
                          color: theme.primaryColor.withOpacity(.5),
                          borderRadius: BorderRadius.circular(8)),
                      child: IconButton(
                        onPressed: () {
                          bottomsheet();
                        },
                        icon: Icon(
                          AppIcons.addImage,
                          size: 70,
                        ),
                      )),
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
              Obx(
                () => CustomButton(
                    text: 'Upload',
                    isloading: recipiesController.uploadLoading.value,
                    onPressed: () => recipiesController.addRecipie(
                        categoryController,
                        nameController,
                        descriptionController,
                        timeController)),
              )
            ],
          ),
        ),
      ),
    );
  }

  void bottomsheet() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Get.isDarkMode ? Colors.grey[900] : Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.blue),
              title: const Text("Take a photo"),
              onTap: () async {
                recipiesController.pickCameraImage();
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library, color: Colors.green),
              title: const Text("Choose from gallery"),
              onTap: () async {
                recipiesController.pickGalleryImage();
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
