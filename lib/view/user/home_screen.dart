import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/constants/app_icons.dart';
import 'package:recipeapp/controller/recipies_controller.dart';
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

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    // List fastFoodList =
    //     foodList.where((item) => item['category'] == 'Fast Food').toList();
    // List drinkList =
    //     foodList.where((item) => item['category'] == 'Drink').toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
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
                  if (recipiesController.fastFoodDataList.isEmpty) {
                    return const Center(child: Text('No recipes found.'));
                  }
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .8,
                    ),
                    itemCount: recipiesController.fastFoodDataList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final recipe = recipiesController.fastFoodDataList[index];
                      return GestureDetector(
                        onTap: () => Get.to(() => DetailScreen()),
                        child: ProductCard(
                          productImage: recipe.image,
                          title: recipe.title,
                          category: recipe.category,
                          time: recipe.time,
                        ),
                      );
                    },
                  );
                }),
                Obx(() {
                  if (recipiesController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (recipiesController.fastFoodDataList.isEmpty) {
                    return const Center(child: Text('No recipes found.'));
                  }
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .8,
                    ),
                    itemCount: recipiesController.drinkDataList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final recipe = recipiesController.drinkDataList[index];
                      return GestureDetector(
                        onTap: () => Get.to(() => DetailScreen()),
                        child: ProductCard(
                          productImage: recipe.image,
                          title: recipe.title,
                          category: recipe.category,
                          time: recipe.time,
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
    );
  }
}
