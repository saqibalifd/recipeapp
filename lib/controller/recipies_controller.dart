import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipeapp/models/recipies_model.dart';

class RecipiesController extends GetxController {
  RxBool fetchLoading = false.obs;
  RxBool uploadLoading = false.obs;
  final _firestore = FirebaseFirestore.instance;
  RxList<RecipeModel> recipiesDataList = <RecipeModel>[].obs;
  Rx<File?> slectedImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();
  RxString selectedCategory = "Fast Food".obs;

  @override
  void onInit() {
    super.onInit();
    fetchRecipies();
  }

  Future<void> fetchRecipies() async {
    fetchLoading.value = true;

    try {
      QuerySnapshot fetchRecipies =
          await _firestore.collection('recipes').get();

      List<RecipeModel> data = fetchRecipies.docs.map((doc) {
        return RecipeModel.fromFirestore(doc.data() as Map<String, dynamic>);
      }).toList();

      recipiesDataList.assignAll(data);
    } catch (e) {
      print("Error fetching recipes: $e");
    } finally {
      fetchLoading.value = false;
    }
  }

  Future pickGalleryImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      slectedImage.value = File(pickedFile.path);
    } else {
      Get.snackbar('Warning', 'Please pick image first');
    }
  }

  Future pickCameraImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      slectedImage.value = File(pickedFile.path);
    } else {
      Get.snackbar('Warning', 'Please pick image first');
    }
  }

  Future addRecipie(
    TextEditingController titleController,
    TextEditingController desciptionController,
    TextEditingController timeController,
    formkey,
  ) async {
    if (formkey.currentState!.validate()) {
      try {
        uploadLoading.value = true;
        DocumentReference docRef = _firestore.collection('recipes').doc();

        String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference storageRef =
            FirebaseStorage.instance.ref().child("images/$fileName.jpg");
        UploadTask uploadTask = storageRef.putFile(slectedImage.value!);
        TaskSnapshot taskSnapshot = await uploadTask;
        String downloadURL = await taskSnapshot.ref.getDownloadURL();

        RecipeModel recipeModel = RecipeModel(
            docId: docRef.id.toString(),
            category: selectedCategory.toString(),
            title: titleController.text.toString(),
            description: desciptionController.text.toString(),
            image: downloadURL.toString(),
            time: timeController.text.toString() + ' min'.toString());

        await docRef.set(recipeModel.toFirestore());
        Get.back();
      } catch (e) {
        Get.snackbar('Error', 'Something went wrong');
      } finally {
        uploadLoading.value = false;
      }
    }
    return null;
  }
}
