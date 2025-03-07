import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/constants/app_colors.dart';
import 'package:recipeapp/constants/app_icons.dart';

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
                  CachedNetworkImage(
                    imageUrl: productImage,
                    placeholder: (context, url) => CupertinoActivityIndicator(
                      radius: 10,
                    ),
                    errorWidget: (context, url, error) => Icon(
                      AppIcons.brokenImage,
                      size: 70,
                    ),
                    fit: BoxFit.cover,
                    height: screenHeight * .18,
                    width: screenWidth * .4,
                  ),
                  Container(
                    height: screenHeight * .18,
                    width: screenWidth * .4,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          AppColors.blackColor.withOpacity(0.8),
                          AppColors.blackColor.withOpacity(0.4),
                          AppColors.transparent,
                        ],
                      ),
                    ),
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
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            '$category . >$time min',
            style: theme.textTheme.bodyMedium,
          ),
        )
      ],
    );
  }
}
