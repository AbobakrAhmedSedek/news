import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/ui/home/widget/view_all_widget.dart';

class CategoryFragment extends StatelessWidget {
  
  final Function onCklick; //  stape : 1
  const CategoryFragment({super.key, required this.onCklick});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final categories = Category.getCategoriesList(isDark);

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Good Morning \n Here is Some News For You",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final isRight = index % 2 == 0;

                final items = [
                  Spacer(),
                  SizedBox(
                    height: height * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            categories[index].name ?? "",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        SizedBox(height: height * 0.06),
                        ViewAll(
                          isRight: isRight,
                        ),
                      ],
                    ),
                  ),
                ];

                return GestureDetector(
                  onTap: () {
                  
                    onCklick(categories[index]);   // stape : 2
                  },
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.symmetric(
                      horizontal: width * 0.02,
                      vertical: height * 0.01,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                      children: [
                        categories[index].image != null
                            ? Image.asset(
                                categories[index].image!,
                                fit: BoxFit.cover,
                              )
                            : const Icon(Icons.image_not_supported),
                        Row(
                          children: isRight ? items : items.reversed.toList(),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
