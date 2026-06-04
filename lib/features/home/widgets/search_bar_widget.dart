import 'package:craftora_app/core/constants/app_colors.dart';
import 'package:craftora_app/core/constants/app_strings.dart';
import 'package:craftora_app/core/theme/app_dimensions.dart';
import 'package:craftora_app/core/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: AppDimensions.searchBarHeight,
            decoration: BoxDecoration(
              color: AppColors.searchBg,
              borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
            ),
            child: Row(
              children: [
                const SizedBox(width: AppDimensions.paddingMD),
                const Icon(
                  Icons.search_rounded,
                  color: AppColors.textHint,
                  size: 20,
                ),
                const SizedBox(width: AppDimensions.spaceSM),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: AppStrings.searchHint,
                      hintStyle: AppTextTheme.searchHint,
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    style: AppTextTheme.searchHint.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: AppDimensions.spaceSM),
        Container(
          height: AppDimensions.searchBarHeight,
          width: AppDimensions.searchBarHeight,
          decoration: BoxDecoration(
            color: AppColors.searchBg,
            borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
          ),
          child: const Icon(
            Icons.tune_rounded,
            color: AppColors.textSecondary,
            size: 20,
          ),
        ),
      ],
    );
  }
}
