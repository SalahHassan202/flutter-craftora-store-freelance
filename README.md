# 🌿 Craftora

> **Handmade with love** — A beautifully crafted Flutter UI for a handmade goods marketplace.

<br>

## 📱 Demo

https://github.com/user-attachments/assets/demo.mp4

> Full demo available at `assets/Demo/demo.mp4`

<br>

## ✨ Features

- 🏠 **Home Screen** — Banner carousel, categories row, and featured products
- 🛍️ **Product Details** — Image swiper, feature badges, quantity selector, and action buttons
- 🔍 **Search Bar** — Clean search UI with filter icon
- ❤️ **Wishlist Toggle** — Add/remove products from favorites per card
- 📱 **Fully Responsive** — Adapts to mobile, tablet, and desktop
- 🎨 **Custom Theme** — Warm beige palette with Playfair Display & Lato fonts
- 🌐 **Network Images** — Loaded via `cached_network_image` with placeholder support

<br>

## 🗂️ Project Structure

```
lib/
├── main.dart
│
├── core/
│   ├── constants/
│   │   ├── app_colors.dart
│   │   ├── app_strings.dart
│   │   └── app_images.dart
│   ├── theme/
│   │   ├── app_dimensions.dart
│   │   └── app_text_theme.dart
│   └── utils/
│       └── responsive_utils.dart
│
└── features/
    ├── home/
    │   ├── home_page.dart
    │   ├── models/
    │   │   ├── category_model.dart
    │   │   └── product_model.dart
    │   └── widgets/
    │       ├── navbar_widget.dart
    │       ├── search_bar_widget.dart
    │       ├── banner_section.dart
    │       ├── categories_section.dart
    │       ├── category_card.dart
    │       ├── products_section.dart
    │       ├── product_card.dart
    │       └── footer_widget.dart
    │
    └── product_details/
        ├── product_details_page.dart
        └── widgets/
            ├── product_app_bar.dart
            ├── product_image_carousel.dart
            ├── product_info_section.dart
            ├── product_features_section.dart
            ├── product_feature_badge.dart
            ├── product_quantity_selector.dart
            └── product_action_buttons.dart
```

<br>

## 📦 Packages

| Package | Version | Purpose |
|---|---|---|
| `google_fonts` | ^6.2.1 | Playfair Display & Lato typography |
| `cached_network_image` | ^3.3.1 | Network image loading with cache |
| `smooth_page_indicator` | ^1.1.0 | Dots indicator for carousels |
| `flutter_svg` | ^2.0.10+1 | SVG asset rendering |
| `gap` | ^3.0.1 | Clean spacing in layouts |
| `responsive_framework` | ^1.4.0 | Responsive breakpoints |

<br>

## 🚀 Getting Started

```bash
# Clone the repo
git clone https://github.com/your-username/craftora.git

# Install dependencies
flutter pub get

# Run the app
flutter run
```

<br>

## 🎨 Design

UI designed in Figma — [View Design File](https://www.figma.com/design/KArUSfhsoc0b9CPaCLOiBr/Craftora?node-id=0-1)

### Color Palette

| Name | Hex |
|---|---|
| Background | `#F5EFE6` |
| Primary | `#3D2B1F` |
| Accent | `#D4A96A` |
| Text Primary | `#2C1A0E` |
| Text Secondary | `#8C7B6B` |

### Typography

- **Headings** — Playfair Display
- **Body** — Lato

<br>

## 📁 Assets

```
assets/
└── Demo/
    └── demo.mp4
```

<br>

## 📄 License

This project is for UI demonstration purposes only.

---

<p align="center">Made with ❤️ using Flutter</p>
