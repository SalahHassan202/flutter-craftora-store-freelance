import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_images.dart';
import '../../core/constants/app_strings.dart';
import '../../core/theme/app_dimensions.dart';
import '../../core/utils/responsive_utils.dart';
import '../home/models/product_model.dart';
import 'widgets/product_action_buttons.dart';
import 'widgets/product_app_bar.dart';
import 'widgets/product_features_section.dart';
import 'widgets/product_image_carousel.dart';
import 'widgets/product_info_section.dart';
import 'widgets/product_quantity_selector.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProductModel? product;

  const ProductDetailsPage({super.key, this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final PageController _imageController = PageController();

  int _quantity = 1;
  bool _isFavorite = false;

  static const List<String> _imageUrls = [
    AppImages.productFragranceCandle,
    AppImages.productFragranceCandle2,
    AppImages.productFragranceCandle3,
  ];

  late final ProductModel _product;

  @override
  void initState() {
    super.initState();
    _product =
        widget.product ??
        const ProductModel(
          id: 'p1',
          name: AppStrings.homeFragranceCandle,
          price: 12.00,
          imageUrl: AppImages.productFragranceCandle,
          rating: 4.8,
          reviewCount: 32,
          description: AppStrings.homeFragranceDesc,
        );
  }

  @override
  void dispose() {
    _imageController.dispose();
    super.dispose();
  }

  void _toggleFavorite() => setState(() => _isFavorite = !_isFavorite);
  void _increment() => setState(() => _quantity++);
  void _decrement() {
    if (_quantity > 1) setState(() => _quantity--);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    final hPadding = ResponsiveUtils.horizontalPadding(context);
    final imageHeight = ResponsiveUtils.isTablet(context) ? 380.0 : 300.0;
    final screenWidth = ResponsiveUtils.screenWidth(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            ProductAppBar(
              isFavorite: _isFavorite,
              horizontalPadding: hPadding,
              onBackTap: () => Navigator.pop(context),
              onFavoriteTap: _toggleFavorite,
              onShareTap: () {},
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductImageCarousel(
                      controller: _imageController,
                      imageUrls: _imageUrls,
                      imageHeight: imageHeight,
                      screenWidth: screenWidth,
                      onPageChanged: (_) {},
                    ),
                    const SizedBox(height: AppDimensions.spaceLG),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: hPadding),
                      child: ProductInfoSection(product: _product),
                    ),
                    const SizedBox(height: AppDimensions.spaceLG),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: hPadding),
                      child: const ProductFeaturesSection(),
                    ),
                    const SizedBox(height: AppDimensions.spaceXL),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: hPadding),
                      child: ProductQuantitySelector(
                        quantity: _quantity,
                        onIncrement: _increment,
                        onDecrement: _decrement,
                      ),
                    ),
                    const SizedBox(height: AppDimensions.spaceXL),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: hPadding),
                      child: ProductActionButtons(
                        onAddToCart: () {},
                        onBuyNow: () {},
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 24,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
