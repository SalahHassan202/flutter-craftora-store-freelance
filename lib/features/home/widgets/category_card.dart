import 'package:craftora_app/core/constants/app_colors.dart';
import 'package:craftora_app/core/theme/app_dimensions.dart';
import 'package:craftora_app/core/theme/app_text_theme.dart';
import 'package:craftora_app/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/category_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback? onTap;

  const CategoryCard({super.key, required this.category, this.onTap});

  @override
  Widget build(BuildContext context) {
    final cardSize = ResponsiveUtils.categoryCardSize(context);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: cardSize,
            height: cardSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
                  child: CachedNetworkImage(
                    imageUrl: category.imageUrl,
                    width: cardSize,
                    height: cardSize,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Container(color: AppColors.accentLight),
                    errorWidget: (context, url, error) => Container(
                      color: AppColors.accentLight,
                      child: const Icon(
                        Icons.image_outlined,
                        color: AppColors.textHint,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 6,
                  right: 6,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      // ignore: deprecated_member_use
                      color: Colors.white.withOpacity(0.9),
                      shape: BoxShape.circle,
                    ),
                    child: Center(child: _categoryIcon(category.name)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppDimensions.spaceXS + 2),
          Text(
            category.name,
            style: AppTextTheme.categoryLabel,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _categoryIcon(String name) {
    IconData icon;
    switch (name.toLowerCase()) {
      case 'candles':
        icon = Icons.local_fire_department_outlined;
        break;
      case 'accessories':
        icon = Icons.watch_outlined;
        break;
      case 'crochet':
        icon = Icons.texture;
        break;
      case 'jewelry':
        icon = Icons.diamond_outlined;
        break;
      case 'pottery':
        icon = Icons.sports_bar_outlined;
        break;
      default:
        icon = Icons.category_outlined;
    }
    return Icon(icon, size: 14, color: AppColors.primary);
  }
}
