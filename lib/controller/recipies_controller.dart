import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:recipeapp/models/recipies_model.dart';

class RecipiesController extends GetxController {
  RxBool isLoading = false.obs;
  final _firestore = FirebaseFirestore.instance;
  RxList<RecipeModel> recipiesDataList = <RecipeModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchRecipies(); // Call API or initialize data
  }

  Future<void> fetchRecipies() async {
    isLoading.value = true;

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
      isLoading.value = false;
    }
  }
}
