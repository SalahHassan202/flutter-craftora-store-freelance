import 'package:craftora_app/core/constants/app_colors.dart';
import 'package:craftora_app/core/constants/app_strings.dart';
import 'package:craftora_app/core/theme/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMD,
        vertical: AppDimensions.paddingLG,
      ),
      child: Column(
        children: [
          const Divider(color: AppColors.divider),
          const SizedBox(height: AppDimensions.spaceMD),
          Text(
            '${AppStrings.appName} • ${AppStrings.appTagline} ♡',
            style: GoogleFonts.lato(
              fontSize: 12,
              color: AppColors.textHint,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: AppDimensions.spaceSM),
          Text(
            '© 2024 All rights reserved',
            style: GoogleFonts.lato(fontSize: 11, color: AppColors.textHint),
          ),
        ],
      ),
    );
  }
}
