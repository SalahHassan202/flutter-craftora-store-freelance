import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/constants/app_colors.dart';

class ProductImageCarousel extends StatelessWidget {
  final PageController controller;
  final List<String> imageUrls;
  final double imageHeight;
  final double screenWidth;
  final ValueChanged<int> onPageChanged;

  const ProductImageCarousel({
    super.key,
    required this.controller,
    required this.imageUrls,
    required this.imageHeight,
    required this.screenWidth,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: imageHeight,
          child: PageView.builder(
            controller: controller,
            itemCount: imageUrls.length,
            onPageChanged: onPageChanged,
            itemBuilder: (context, index) {
              return _CarouselImage(
                imageUrl: imageUrls[index],
                width: screenWidth,
                height: imageHeight,
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        SmoothPageIndicator(
          controller: controller,
          count: imageUrls.length,
          effect: const ExpandingDotsEffect(
            dotHeight: 6,
            dotWidth: 6,
            activeDotColor: AppColors.primary,
            dotColor: AppColors.accentLight,
            spacing: 4,
            expansionFactor: 3,
          ),
        ),
      ],
    );
  }
}

class _CarouselImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const _CarouselImage({
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      width: width,
      height: height,
      placeholder: (context, url) => Container(color: AppColors.accentLight),
      errorWidget: (context, url, error) => Container(
        color: AppColors.accentLight,
        child: const Icon(
          Icons.image_outlined,
          color: AppColors.textHint,
          size: 48,
        ),
      ),
    );
  }
}
