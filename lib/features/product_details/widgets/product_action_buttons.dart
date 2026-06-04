import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_theme.dart';

class ProductActionButtons extends StatelessWidget {
  final VoidCallback onAddToCart;
  final VoidCallback onBuyNow;

  const ProductActionButtons({
    super.key,
    required this.onAddToCart,
    required this.onBuyNow,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _AddToCartButton(onTap: onAddToCart),
        const SizedBox(height: AppDimensions.spaceMD),
        _BuyNowButton(onTap: onBuyNow),
      ],
    );
  }
}

class _AddToCartButton extends StatelessWidget {
  final VoidCallback onTap;

  const _AddToCartButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
          ),
        ),
        icon: const Icon(Icons.shopping_bag_outlined, size: 18),
        label: Text(AppStrings.addToCart, style: AppTextTheme.addToCartButton),
      ),
    );
  }
}

class _BuyNowButton extends StatelessWidget {
  final VoidCallback onTap;

  const _BuyNowButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
          ),
        ),
        child: Text(AppStrings.buyNow, style: AppTextTheme.buyNowButton),
      ),
    );
  }
}
