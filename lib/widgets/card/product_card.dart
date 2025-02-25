import 'package:flutter/material.dart';
import 'package:recipeapp/constants/app_colors.dart';

class ProductCard extends StatelessWidget {
  final String productImage;
  final String title;
  final String category;
  final String time;
  const ProductCard(
      {super.key,
      required this.productImage,
      required this.title,
      required this.category,
      required this.time});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  Image.asset(
                      fit: BoxFit.cover,
                      height: screenHeight * .18,
                      width: screenWidth * .4,
                      productImage),
                  Container(
                    height: screenHeight * .18,
                    width: screenWidth * .4,
                    color: AppColors.blackColor.withValues(alpha: .2),
                  )
                ],
              )),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: screenHeight * .01, horizontal: screenWidth * .06),
          child: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            title,
            style: theme.textTheme.headlineMedium,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * .06),
          child: Text(
            '$category . >$time min',
            style: theme.textTheme.bodyMedium,
          ),
        )
      ],
    );
  }
}
