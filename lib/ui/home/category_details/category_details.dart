import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/model/sourse_response.dart';
import 'package:news_app/ui/home/widget/sourse_tap_widget.dart';
import 'package:news_app/utils/app_styles.dart';

class CategoryDetails extends StatefulWidget {
  final Category category;     // stape : 10

  const CategoryDetails({super.key, required this.category});
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSourses( widget.category.id ?? ""     // stape : 11
),
      builder: (BuildContext context, AsyncSnapshot<SourseResponse?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Something went wrong"),
          );
        } else if (snapshot.data?.status == "error") {
          return Column(
            children: [
              Text(
                snapshot.data!.message!,
                style: AppStyles.medium20Black,
              ),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getSourses( widget.category.id ?? ""     // stape : 12
);
                    setState(() {});
                  },
                  child: const Text("Retry"))
            ],
          );
        }
        return SourseTapWidget(
          sourceList: snapshot.data!.sources!,
        );
        
      },
    );
  }
 
}
