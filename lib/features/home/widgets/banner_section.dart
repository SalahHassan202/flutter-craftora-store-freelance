import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_images.dart';
import '../../core/constants/app_strings.dart';
import '../../core/theme/app_dimensions.dart';
import '../../core/theme/app_text_theme.dart';
import '../../core/utils/responsive_utils.dart';

class BannerSection extends StatefulWidget {
  const BannerSection({super.key});

  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  final PageController _controller = PageController();

  static const List<_BannerData> _banners = [
    _BannerData(
      image: AppImages.bannerCandle,
      title: AppStrings.bannerTitle,
      subtitle: AppStrings.bannerSubtitle,
    ),
    _BannerData(
      image: AppImages.productFragranceCandle2,
      title: 'Crafted with\npassion & care',
      subtitle: 'Discover one-of-a-kind\nartisan creations',
    ),
    _BannerData(
      image: AppImages.productCrochetBag,
      title: 'Gifts that tell\na story',
      subtitle: 'Find the perfect handmade\ngift for your loved ones',
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bannerHeight = ResponsiveUtils.bannerHeight(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
      child: SizedBox(
        height: bannerHeight,
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: _banners.length,
              onPageChanged: (_) => setState(() {}),
              itemBuilder: (context, index) =>
                  _BannerItem(data: _banners[index]),
            ),
            Positioned(
              bottom: 14,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: _banners.length,
                  effect: const ExpandingDotsEffect(
                    dotHeight: 5,
                    dotWidth: 5,
                    activeDotColor: Colors.white,
                    dotColor: Colors.white38,
                    spacing: 4,
                    expansionFactor: 3,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BannerItem extends StatelessWidget {
  final _BannerData data;

  const _BannerItem({required this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CachedNetworkImage(
          imageUrl: data.image,
          fit: BoxFit.cover,
          placeholder: (_, __) => Container(color: AppColors.accentLight),
          errorWidget: (_, __, ___) => Container(color: AppColors.accentLight),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.65),
              ],
            ),
          ),
        ),
        Positioned(
          left: AppDimensions.paddingLG,
          bottom: 36,
          right: MediaQuery.of(context).size.width * 0.35,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(data.title, style: AppTextTheme.bannerTitle),
              const SizedBox(height: 6),
              Text(data.subtitle, style: AppTextTheme.bannerSubtitle),
              const SizedBox(height: 14),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 9,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppDimensions.radiusSM),
                  ),
                  child: Text(
                    AppStrings.shopNow,
                    style: AppTextTheme.shopNowButton,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BannerData {
  final String image;
  final String title;
  final String subtitle;

  const _BannerData({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}
