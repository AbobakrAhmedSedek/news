import 'package:news_app/utils/asses_managment.dart';

class Category {
  String? name;
  String? image;
  String? id;

  Category({required this.name, required this.image, required this.id });

  static List<Category> getCategoriesList(bool isDark) {
    return [
      Category(
          id: "general",
          name: "General",
          image: isDark
              ? AssetsManager.generalLightImage 
              : AssetsManager.generalDarkImage),
      Category(
          id: "business",
          name: "Business",
          image: isDark
              ? AssetsManager.businessLightImage
              : AssetsManager.businessDarkImage),
      Category(
          id: "sports",
          name: "Sports",
          image: isDark
              ? AssetsManager.sportsLightImage
              : AssetsManager.sportsDarkImage),
    
      Category(
          id: "health",
          name: "Health",
          image: isDark
              ? AssetsManager.healthLightImage
              : AssetsManager.healthDarkImage ),
      Category(
          id: "science",
          name: "Science",
          image: isDark
              ? AssetsManager.scienceLightImage
              : AssetsManager.scienceDarkImage),
    
      Category(
          id: "technology",
          name: "Technology",
          image: isDark
              ? AssetsManager.technologyLightImage
              : AssetsManager.technologyDarkImage),
                Category(
          id: "entertainment",
          name: "Entertainment",
          image: isDark
              ? AssetsManager.entertainmentLightImage
              : AssetsManager.entertainmentDarkImage),
    ];
  }

}
