import 'package:flutter/material.dart';
import 'package:news_app/model/sourse_response.dart';

class SourceTabNameWidget extends StatelessWidget {
  final bool isSelected;
  final Source source;
  const SourceTabNameWidget(
      {super.key, required this.source, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Text(
      source.name ?? "",
      style: isSelected
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.labelMedium,
    );
  }
}
