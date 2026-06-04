import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_theme.dart';
import '../../home/models/product_model.dart';

class ProductInfoSection extends StatelessWidget {
  final ProductModel product;

  const ProductInfoSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _NameAndRatingRow(product: product),
        const SizedBox(height: AppDimensions.spaceSM),
        Text(product.formattedPrice, style: AppTextTheme.productDetailPrice),
        const SizedBox(height: AppDimensions.spaceSM),
        Text(
          product.description.isEmpty
              ? AppStrings.homeFragranceDesc
              : product.description,
          style: AppTextTheme.productDetailDesc,
        ),
      ],
    );
  }
}

class _NameAndRatingRow extends StatelessWidget {
  final ProductModel product;

  const _NameAndRatingRow({required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(product.name, style: AppTextTheme.productDetailName),
        ),
        const SizedBox(width: AppDimensions.spaceSM),
        _RatingBadge(rating: product.rating, reviewCount: product.reviewCount),
      ],
    );
  }
}

class _RatingBadge extends StatelessWidget {
  final double rating;
  final int reviewCount;

  const _RatingBadge({required this.rating, required this.reviewCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.star_rounded, color: AppColors.star, size: 16),
        const SizedBox(width: 3),
        Text(
          '$rating($reviewCount)',
          style: AppTextTheme.rating,
        ),
      ],
    );
  }
}
