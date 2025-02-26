import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:recipeapp/models/recipies_model.dart';

class RecipiesController extends GetxController {
  RxBool isLoading = false.obs;
  final _firestore = FirebaseFirestore.instance;
  RxList<RecipeModel> fastFoodDataList = <RecipeModel>[].obs;
  RxList<RecipeModel> drinkDataList = <RecipeModel>[].obs;

  Future<void> fetchRecipies() async {
    isLoading.value = true;

    try {
      QuerySnapshot fastFoodSnapshot = await _firestore
          .collection('recipes')
          .where('category', isEqualTo: 'Fast Food')
          .get();
      QuerySnapshot drinkSnapshot = await _firestore
          .collection('recipes')
          .where('category', isEqualTo: 'Drink')
          .get();

      List<RecipeModel> fetchedFastFood = fastFoodSnapshot.docs.map((doc) {
        return RecipeModel.fromFirestore(doc.data() as Map<String, dynamic>);
      }).toList();
      List<RecipeModel> fetchedDrink = drinkSnapshot.docs.map((doc) {
        return RecipeModel.fromFirestore(doc.data() as Map<String, dynamic>);
      }).toList();

      fastFoodDataList.assignAll(fetchedFastFood);
      drinkDataList.assignAll(fetchedDrink);
    } catch (e) {
      print("Error fetching recipes: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
