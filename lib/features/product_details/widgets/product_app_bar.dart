import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_theme.dart';

class ProductAppBar extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onBackTap;
  final VoidCallback onFavoriteTap;
  final VoidCallback onShareTap;
  final double horizontalPadding;

  const ProductAppBar({
    super.key,
    required this.isFavorite,
    required this.onBackTap,
    required this.onFavoriteTap,
    required this.onShareTap,
    required this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Row(
        children: [
          _AppBarIconButton(
            icon: Icons.chevron_left_rounded,
            onTap: onBackTap,
            iconSize: 22,
          ),
          const Spacer(),
          Text(
            AppStrings.productDetailsTitle,
            style: AppTextTheme.sectionTitle,
          ),
          const Spacer(),
          Row(
            children: [
              _AppBarIconButton(
                icon: isFavorite
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                iconColor:
                    isFavorite ? AppColors.error : AppColors.textSecondary,
                onTap: onFavoriteTap,
              ),
              const SizedBox(width: AppDimensions.spaceSM),
              _AppBarIconButton(
                icon: Icons.ios_share_rounded,
                onTap: onShareTap,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AppBarIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final VoidCallback onTap;

  const _AppBarIconButton({
    required this.icon,
    required this.onTap,
    this.iconColor = AppColors.textSecondary,
    this.iconSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimensions.radiusSM),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, size: iconSize, color: iconColor),
      ),
    );
  }
}
