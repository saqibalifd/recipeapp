import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/constants/app_icons.dart';
import 'package:recipeapp/constants/app_images.dart';
import 'package:recipeapp/controller/recipies_controller.dart';
import 'package:recipeapp/view/user/detail_screen.dart';
import 'package:recipeapp/widgets/card/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final List foodList = [
    {
      'image': AppImages.dummyImage1,
      'title': 'Cheez burger',
      'category': 'Fast Food',
      'time': '30',
      'description':
          'This food is very delecius you can use it in any dish you want in your meal This food is very delecius you can use it in any dish you want in your meal This food is very delecius you can use it in any dish you want in your mealThis food is very delecius you can use it in any dish you want in your meal'
    },
    {
      'image': AppImages.dummyImage2,
      'title': 'Pizza',
      'category': 'Fast Food',
      'time': '30',
      'description':
          'This food is very delecius you can use it in any dish you want in your meal This food is very delecius you can use it in any dish you want in your meal This food is very delecius you can use it in any dish you want in your mealThis food is very delecius you can use it in any dish you want in your meal'
    },
    {
      'image': AppImages.dummyImage3,
      'title': 'Sandvich',
      'category': 'Fast Food',
      'time': '30',
      'description':
          'This food is very delecius you can use it in any dish you want in your meal This food is very delecius you can use it in any dish you want in your meal This food is very delecius you can use it in any dish you want in your mealThis food is very delecius you can use it in any dish you want in your meal'
    },
    {
      'image': AppImages.dummyImage4,
      'title': 'Smosa',
      'category': 'Fast Food',
      'time': '30',
      'description':
          'This food is very delecius you can use it in any dish you want in your meal This food is very delecius you can use it in any dish you want in your meal This food is very delecius you can use it in any dish you want in your mealThis food is very delecius you can use it in any dish you want in your meal'
    },
    {
      'image': AppImages.dummyImage5,
      'title': 'Apple juice',
      'category': 'Drink',
      'time': '30',
      'description':
          'This food is very delecius you can use it in any dish you want in your meal This food is very delecius you can use it in any dish you want in your meal This food is very delecius you can use it in any dish you want in your mealThis food is very delecius you can use it in any dish you want in your meal'
    },
    {
      'image': AppImages.dummyImage6,
      'title': 'Banana juice',
      'category': 'Drink',
      'time': '30',
      'description':
          'This food is very delecius you can use it in any dish you want in your meal This food is very delecius you can use it in any dish you want in your meal This food is very delecius you can use it in any dish you want in your mealThis food is very delecius you can use it in any dish you want in your meal'
    },
    {
      'image': AppImages.dummyImage7,
      'title': 'Lemon juice',
      'category': 'Drink',
      'time': '30',
      'description':
          'This food is very delecius you can use it in any dish you want in your meal This food is very delecius you can use it in any dish you want in your meal This food is very delecius you can use it in any dish you want in your mealThis food is very delecius you can use it in any dish you want in your meal'
    },
  ];

  final RecipiesController recipiesController = Get.put(RecipiesController());

  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    List fastFoodList =
        foodList.where((item) => item['category'] == 'Fast Food').toList();
    List drinkList =
        foodList.where((item) => item['category'] == 'Drink').toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [IconButton(onPressed: () {}, icon: Icon(AppIcons.theme))],
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
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('recipes')
                      .where('category', isEqualTo: 'Fast Food')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text('No recipes found.'));
                    }
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .8,
                      ),
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final doc = snapshot.data!.docs[index];
                        return GestureDetector(
                          onTap: () => Get.to(() => DetailScreen()),
                          child: ProductCard(
                            productImage: doc['image'],
                            title: doc['title'],
                            category: doc['category'],
                            time: doc['time'],
                          ),
                        );
                      },
                    );
                  },
                ),
                // Obx(
                //   () {
                //     if (recipiesController.isLoading == true) {
                //       return CircularProgressIndicator();
                //     } else if (recipiesController.recipiesDataList.isEmpty) {
                //       Text('Data not found');
                //     }

                //     return GridView.builder(
                //       gridDelegate:
                //           const SliverGridDelegateWithFixedCrossAxisCount(
                //         crossAxisCount: 2,
                //         childAspectRatio: 1.1,
                //       ),
                //       itemCount: recipiesController.recipiesDataList.length,
                //       shrinkWrap: true,
                //       itemBuilder: (context, index) {
                //         return GestureDetector(
                //           onTap: () {
                //             recipiesController.fetchRecipies();
                //           },
                //           // onTap: () => Get.to(() => DetailScreen()),
                //           child: ProductCard(
                //             productImage: recipiesController
                //                 .recipiesDataList[index].image,
                //             title: recipiesController
                //                 .recipiesDataList[index].title,
                //             category: recipiesController
                //                 .recipiesDataList[index].category,
                //             time: recipiesController
                //                 .recipiesDataList[index].time,
                //           ),
                //           // child: ProductCard(
                //           //   productImage: fastFoodList[index]['image'],
                //           //   title: fastFoodList[index]['title'],
                //           //   category: fastFoodList[index]['category'],
                //           //   time: fastFoodList[index]['time'],
                //           // ),
                //         );
                //       },
                //     );
                //   },
                // ),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('recipes')
                      .where('category', isEqualTo: 'Drink')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text('No recipes found.'));
                    }
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .8,
                      ),
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final doc = snapshot.data!.docs[index];
                        return GestureDetector(
                          onTap: () => Get.to(() => DetailScreen()),
                          child: ProductCard(
                            productImage: doc['image'],
                            title: doc['title'],
                            category: doc['category'],
                            time: doc['time'],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
