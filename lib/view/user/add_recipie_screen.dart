import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/constants/app_icons.dart';
import 'package:recipeapp/constants/app_images.dart';
import 'package:recipeapp/controller/recipies_controller.dart';
import 'package:recipeapp/widgets/button/custom_button_widget.dart';
import 'package:recipeapp/widgets/field/custom_textfield_widget.dart';

class AddRecipieScreen extends StatefulWidget {
  const AddRecipieScreen({super.key});

  @override
  State<AddRecipieScreen> createState() => _AddRecipieScreenState();
}

class _AddRecipieScreenState extends State<AddRecipieScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final RecipiesController recipiesController = Get.put(RecipiesController());
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * .05),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight * .1,
                ),
                Stack(
                  children: [
                    Obx(() => Container(
                          height: screenHeight * .2,
                          width: screenWidth * .9,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(8)),
                          child: recipiesController.slectedImage.value != null
                              ? Image.file(
                                  recipiesController.slectedImage.value!,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  AppImages.dummyImage1,
                                  fit: BoxFit.cover,
                                ),
                        )),
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
                Obx(() => Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton<String>(
                        value: recipiesController.selectedCategory.value,
                        isExpanded: true,
                        underline: SizedBox(),
                        items: ["Fast Food", "Drink"]
                            .map((category) => DropdownMenuItem<String>(
                                  value: category,
                                  child: Text(category),
                                ))
                            .toList(),
                        onChanged: (value) {
                          recipiesController.selectedCategory.value = value!;
                        },
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * .01),
                  child: CustomTextField(
                      keyboardType: TextInputType.number,
                      validate: (value) {
                        if (value == '' || value == null) {
                          return 'Please enter cocking time';
                        }
                        return null;
                      },
                      textEditingController: timeController,
                      hint: 'Recipie Time'),
                ),
                CustomTextField(
                    validate: (value) {
                      if (value == '' || value == null) {
                        return 'Please enter recipie name';
                      }
                      return null;
                    },
                    textEditingController: nameController,
                    hint: 'Recipie Name'),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * .01),
                  child: CustomTextField(
                      validate: (value) {
                        if (value == '' || value == null) {
                          return 'Please enter details';
                        }
                        return null;
                      },
                      textEditingController: descriptionController,
                      hint: 'Recipie Detail'),
                ),
                SizedBox(
                  height: screenHeight * .1,
                ),
                Obx(
                  () => CustomButton(
                      text: 'Upload',
                      isloading: recipiesController.uploadLoading.value,
                      onPressed: () {
                        recipiesController.addRecipie(nameController,
                            descriptionController, timeController, _formKey);
                        recipiesController.fetchRecipies();
                      }),
                )
              ],
            ),
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
