import 'package:craftora_app/core/constants/app_colors.dart';
import 'package:craftora_app/core/theme/app_dimensions.dart';
import 'package:craftora_app/core/theme/app_text_theme.dart';
import 'package:craftora_app/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/product_model.dart';

class ProductCard extends StatefulWidget {
  final ProductModel product;
  final VoidCallback? onTap;

  const ProductCard({super.key, required this.product, this.onTap});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.product.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    final cardWidth = ResponsiveUtils.productCardWidth(context);

    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        width: cardWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
                  child: CachedNetworkImage(
                    imageUrl: widget.product.imageUrl,
                    width: cardWidth,
                    height: AppDimensions.productCardImageHeight,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      width: cardWidth,
                      height: AppDimensions.productCardImageHeight,
                      color: AppColors.accentLight,
                    ),
                    errorWidget: (context, url, error) => Container(
                      width: cardWidth,
                      height: AppDimensions.productCardImageHeight,
                      color: AppColors.accentLight,
                      child: const Icon(
                        Icons.image_outlined,
                        color: AppColors.textHint,
                        size: 32,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      setState(() => _isFavorite = !_isFavorite);
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color: Colors.white.withOpacity(0.9),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: AppColors.shadow, blurRadius: 4),
                        ],
                      ),
                      child: Icon(
                        _isFavorite
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        size: 15,
                        color: _isFavorite
                            ? AppColors.error
                            : AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.spaceXS + 2),
            Text(
              widget.product.name,
              style: AppTextTheme.productName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              widget.product.formattedPrice,
              style: AppTextTheme.productPrice,
            ),
          ],
        ),
      ),
    );
  }
}
