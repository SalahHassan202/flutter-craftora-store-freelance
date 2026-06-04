import 'package:craftora_app/core/constants/app_images.dart';
import 'package:craftora_app/core/constants/app_strings.dart';
import 'package:craftora_app/core/theme/app_dimensions.dart';
import 'package:craftora_app/core/theme/app_text_theme.dart';
import 'package:craftora_app/features/home/widgets/category_card.dart';
import 'package:flutter/material.dart';
import '../models/category_model.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  static final List<CategoryModel> _categories = [
    CategoryModel(
      id: '1',
      name: AppStrings.categoryCandles,
      imageUrl: AppImages.categoryCandles,
      itemCount: 24,
    ),
    CategoryModel(
      id: '2',
      name: AppStrings.categoryAccessories,
      imageUrl: AppImages.categoryAccessories,
      itemCount: 38,
    ),
    CategoryModel(
      id: '3',
      name: AppStrings.categoryCrochet,
      imageUrl: AppImages.categoryCrochet,
      itemCount: 17,
    ),
    CategoryModel(
      id: '4',
      name: AppStrings.categoryJewelry,
      imageUrl: AppImages.categoryJewelry,
      itemCount: 29,
    ),
    CategoryModel(
      id: '5',
      name: AppStrings.categoryPottery,
      imageUrl: AppImages.categoryPottery,
      itemCount: 12,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppStrings.shopByCategory, style: AppTextTheme.sectionTitle),
            GestureDetector(
              onTap: () {},
              child: Text(AppStrings.viewAll, style: AppTextTheme.viewAll),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.spaceLG),
        SizedBox(
          height: 140,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            separatorBuilder: (_, __) =>
                const SizedBox(width: AppDimensions.spaceLG),
            itemBuilder: (context, index) {
              return CategoryCard(category: _categories[index], onTap: () {});
            },
          ),
        ),
      ],
    );
  }
}
