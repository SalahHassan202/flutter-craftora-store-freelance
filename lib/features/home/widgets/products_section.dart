import 'package:craftora_app/core/constants/app_images.dart';
import 'package:craftora_app/core/constants/app_strings.dart';
import 'package:craftora_app/core/theme/app_dimensions.dart';
import 'package:craftora_app/core/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import '../models/product_model.dart';
import 'product_card.dart';

class ProductsSection extends StatelessWidget {
  final String title;
  final List<ProductModel>? products;

  const ProductsSection({
    super.key,
    this.title = AppStrings.featuredProducts,
    this.products,
  });

  static final List<ProductModel> _defaultProducts = [
    ProductModel(
      id: '1',
      name: AppStrings.bubbleCandle,
      price: 12.00,
      imageUrl: AppImages.productBubbleCandle,
      rating: 4.7,
      reviewCount: 18,
    ),
    ProductModel(
      id: '2',
      name: AppStrings.crochetBag,
      price: 28.00,
      imageUrl: AppImages.productCrochetBag,
      rating: 4.9,
      reviewCount: 34,
    ),
    ProductModel(
      id: '3',
      name: AppStrings.beadedBracelet,
      price: 15.00,
      imageUrl: AppImages.productBeadedBracelet,
      rating: 4.6,
      reviewCount: 22,
    ),
    ProductModel(
      id: '4',
      name: 'Ceramic Vase',
      price: 35.00,
      imageUrl: AppImages.productCeramicVase,
      rating: 4.8,
      reviewCount: 15,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final list = products ?? _defaultProducts;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: AppTextTheme.sectionTitle),
            GestureDetector(
              onTap: () {},
              child: Text(AppStrings.viewAll, style: AppTextTheme.viewAll),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.spaceLG),
        SizedBox(
          height: 185,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            separatorBuilder: (_, __) =>
                const SizedBox(width: AppDimensions.spaceLG),
            itemBuilder: (context, index) {
              return ProductCard(product: list[index], onTap: () {});
            },
          ),
        ),
      ],
    );
  }
}
