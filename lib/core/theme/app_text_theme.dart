import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextStyle get appName => GoogleFonts.playfairDisplay(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
        letterSpacing: 0.3,
      );

  static TextStyle get appTagline => GoogleFonts.lato(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        letterSpacing: 0.5,
      );

  static TextStyle get sectionTitle => GoogleFonts.playfairDisplay(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      );

  static TextStyle get viewAll => GoogleFonts.lato(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryLight,
      );

  static TextStyle get bannerTitle => GoogleFonts.playfairDisplay(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.white,
        height: 1.3,
      );

  static TextStyle get bannerSubtitle => GoogleFonts.lato(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.white70,
        height: 1.5,
      );

  static TextStyle get shopNowButton => GoogleFonts.lato(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
        letterSpacing: 0.3,
      );

  static TextStyle get categoryLabel => GoogleFonts.lato(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle get productName => GoogleFonts.lato(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle get productPrice => GoogleFonts.playfairDisplay(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
      );

  static TextStyle get productDetailName => GoogleFonts.playfairDisplay(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      );

  static TextStyle get productDetailPrice => GoogleFonts.playfairDisplay(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
      );

  static TextStyle get productDetailDesc => GoogleFonts.lato(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.6,
      );

  static TextStyle get rating => GoogleFonts.lato(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.textSecondary,
      );

  static TextStyle get featureBadge => GoogleFonts.lato(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.4,
      );

  static TextStyle get quantityNumber => GoogleFonts.playfairDisplay(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      );

  static TextStyle get addToCartButton => GoogleFonts.lato(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: Colors.white,
        letterSpacing: 0.3,
      );

  static TextStyle get buyNowButton => GoogleFonts.lato(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
        letterSpacing: 0.3,
      );

  static TextStyle get searchHint => GoogleFonts.lato(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textHint,
      );

  static TextStyle get navLabel => GoogleFonts.lato(
        fontSize: 11,
        fontWeight: FontWeight.w500,
      );
}
