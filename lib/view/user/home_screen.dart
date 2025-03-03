import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/constants/app_icons.dart';
import 'package:recipeapp/controller/recipies_controller.dart';
import 'package:recipeapp/controller/theme_controller.dart';
import 'package:recipeapp/models/recipies_model.dart';
import 'package:recipeapp/view/user/add_recipie_screen.dart';
import 'package:recipeapp/view/user/detail_screen.dart';
import 'package:recipeapp/widgets/card/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final RecipiesController recipiesController = Get.put(RecipiesController());

  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    recipiesController.fetchRecipies();
  }

  ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    List<RecipeModel> fastFoodList = recipiesController.recipiesDataList
        .where((item) => item.category == 'Fast Food')
        .toList();
    List<RecipeModel> drinkList = recipiesController.recipiesDataList
        .where((item) => item.category == 'Drink')
        .toList();

    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                // themeController.switchTheme();
                recipiesController.fetchRecipies();
              },
              icon: Icon(AppIcons.theme))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: screenHeight * .03,
          ),
          TabBar(indicatorWeight: 3.0, controller: tabController, tabs: [
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * .01),
              child: Text('Fast Food'),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * .01),
              child: Text('Drink'),
            ),
          ]),
          SizedBox(
            height: screenHeight * .04,
          ),
          Expanded(
            child: TabBarView(
              key: ValueKey<int>(tabController.index),
              controller: tabController,
              children: [
                Obx(() {
                  if (recipiesController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (recipiesController.recipiesDataList.isEmpty) {
                    return const Center(child: Text('No recipes found.'));
                  }
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .8,
                    ),
                    itemCount: fastFoodList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final data = fastFoodList[index];
                      return GestureDetector(
                        onTap: () {
                          RecipeModel recipeModel = RecipeModel(
                              docId: data.docId,
                              category: data.category,
                              title: data.title,
                              description: data.description,
                              image: data.image,
                              time: data.time);
                          Get.to(() => DetailScreen(), arguments: recipeModel);
                        },
                        child: ProductCard(
                          productImage: data.image,
                          title: data.title,
                          category: data.category,
                          time: data.time,
                        ),
                      );
                    },
                  );
                }),
                Obx(() {
                  if (recipiesController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (recipiesController.recipiesDataList.isEmpty) {
                    return const Center(child: Text('No recipes found.'));
                  }
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .8,
                    ),
                    itemCount: drinkList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final data = drinkList[index];

                      return GestureDetector(
                        onTap: () {
                          RecipeModel recipeModel = RecipeModel(
                              docId: data.docId,
                              category: data.category,
                              title: data.title,
                              description: data.description,
                              image: data.image,
                              time: data.time);
                          Get.to(() => DetailScreen(), arguments: recipeModel);
                        },
                        child: ProductCard(
                          productImage: data.image,
                          title: data.title,
                          category: data.category,
                          time: data.time,
                        ),
                      );
                    },
                  );
                }),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddRecipieScreen());
        },
        child: Icon(
          AppIcons.add,
          color: theme.primaryColor,
        ),
      ),
    );
  }
}
