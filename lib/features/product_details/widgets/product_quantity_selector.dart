import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_theme.dart';

class ProductQuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const ProductQuantitySelector({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.selectQuantity, style: AppTextTheme.sectionTitle),
        const SizedBox(height: AppDimensions.spaceLG),
        Row(
          children: [
            _QuantityButton(icon: Icons.remove_rounded, onTap: onDecrement),
            const SizedBox(width: AppDimensions.spaceLG),
            Text('$quantity', style: AppTextTheme.quantityNumber),
            const SizedBox(width: AppDimensions.spaceLG),
            _QuantityButton(icon: Icons.add_rounded, onTap: onIncrement),
          ],
        ),
      ],
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QuantityButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppDimensions.radiusSM),
          border: Border.all(color: AppColors.divider, width: 1),
        ),
        child: Icon(icon, size: 18, color: AppColors.textPrimary),
      ),
    );
  }
}
