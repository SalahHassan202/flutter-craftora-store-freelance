import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../core/theme/app_dimensions.dart';
import '../../core/theme/app_text_theme.dart';
import '../../core/utils/responsive_utils.dart';
import '../product_details/product_details_page.dart';
import 'widgets/banner_section.dart';
import 'widgets/categories_section.dart';
import 'widgets/footer_widget.dart';
import 'widgets/navbar_widget.dart';
import 'widgets/products_section.dart';
import 'widgets/search_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    final hPadding = ResponsiveUtils.horizontalPadding(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _buildAppBar(context, hPadding),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppDimensions.spaceSM),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: hPadding),
                      child: const SearchBarWidget(),
                    ),
                    const SizedBox(height: AppDimensions.spaceLG),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: hPadding),
                      child: const BannerSection(),
                    ),
                    const SizedBox(height: AppDimensions.spaceXL),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: hPadding),
                      child: const CategoriesSection(),
                    ),
                    const SizedBox(height: AppDimensions.spaceXL),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: hPadding),
                      child: const ProductsSection(),
                    ),
                    const SizedBox(height: AppDimensions.spaceXL),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: hPadding),
                      child: ProductsSection(
                        title: 'New Arrivals',
                        products: null,
                      ),
                    ),
                    const FooterWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavbarWidget(
        currentIndex: _currentNavIndex,
        onTap: (index) {
          setState(() => _currentNavIndex = index);
        },
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, double hPadding) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: hPadding),
      child: Row(
        children: [
          const Icon(
            Icons.menu_rounded,
            color: AppColors.textPrimary,
            size: AppDimensions.iconMD,
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.eco_rounded,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(AppStrings.appName, style: AppTextTheme.appName),
                ],
              ),
              Text(
                '${AppStrings.appTagline} ♡',
                style: AppTextTheme.appTagline,
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProductDetailsPage()),
              );
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(
                  Icons.shopping_bag_outlined,
                  color: AppColors.textPrimary,
                  size: AppDimensions.iconMD,
                ),
                Positioned(
                  top: -4,
                  right: -4,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '2',
                        style: GoogleFonts.lato(
                          fontSize: 8,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
