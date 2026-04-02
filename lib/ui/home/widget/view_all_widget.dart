import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';

class ViewAll extends StatelessWidget {
  final bool isRight;
  const ViewAll({super.key, required this.isRight , });

  @override
  Widget build(BuildContext context) {
    final items = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "View All",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Icon(
          isRight ? Icons.chevron_right : Icons.chevron_left,
          size: 30,
        ),
      ),
    ];

    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: isRight ? items : items.reversed.toList(),
      ),
    );
  }
}