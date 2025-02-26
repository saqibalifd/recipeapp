import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:recipeapp/models/recipies_model.dart';

class RecipiesController extends GetxController {
  RxBool isLoading = false.obs;
  final _firestore = FirebaseFirestore.instance;
  RxList<RecipeModel> recipiesDataList = <RecipeModel>[].obs;

  Future fetchRecipies() async {
    isLoading.value = true;

    QuerySnapshot snapshot = await _firestore.collection('recipes').get();

    List<RecipeModel> fetchedRecipies = snapshot.docs.map((doc) {
      return RecipeModel.fromFirestore(doc.data() as Map<String, dynamic>);
    }).toList();

    print('************************${fetchedRecipies.length.toString()}');
    recipiesDataList.assignAll(fetchedRecipies);

    try {
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }
}
