import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import 'product_feature_badge.dart';

class ProductFeaturesSection extends StatelessWidget {
  const ProductFeaturesSection({super.key});

  static const List<_FeatureData> _features = [
    _FeatureData(icon: Icons.local_fire_department_outlined, label: AppStrings.softWax),
    _FeatureData(icon: Icons.back_hand_outlined, label: AppStrings.handPoured),
    _FeatureData(icon: Icons.eco_outlined, label: AppStrings.ecoFriendly),
    _FeatureData(icon: Icons.delete_outline_rounded, label: AppStrings.reusableJar),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _features
          .map((f) => ProductFeatureBadge(icon: f.icon, label: f.label))
          .toList(),
    );
  }
}

class _FeatureData {
  final IconData icon;
  final String label;

  const _FeatureData({required this.icon, required this.label});
}
