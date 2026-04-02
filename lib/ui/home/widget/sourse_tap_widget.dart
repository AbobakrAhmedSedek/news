import 'package:flutter/material.dart';
import 'package:news_app/model/sourse_response.dart';
import 'package:news_app/ui/home/widget/news_widget.dart';
import 'package:news_app/ui/home/widget/source_tab_name_widget.dart';

// ignore: must_be_immutable
class SourseTapWidget extends StatefulWidget {
  final List<Source> sourceList;
  int selectedIndex = 0;
  SourseTapWidget({
    required this.sourceList,
    super.key,
  });

  @override
  State<SourseTapWidget> createState() => _SourseTapWidgetState();
}

class _SourseTapWidgetState extends State<SourseTapWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourceList.length,
        child: Column(
          children: [
            TabBar(
              dividerColor: Colors.transparent,
              physics: const BouncingScrollPhysics(),
              splashBorderRadius: BorderRadius.circular(10),
              splashFactory: InkRipple.splashFactory,
              indicatorSize: TabBarIndicatorSize.tab,
              tabAlignment: TabAlignment.center,
              isScrollable: true,
              indicatorColor: Theme.of(context).indicatorColor,
              onTap: (index) {
                setState(() {
                  widget.selectedIndex = index;
                });
              },
              tabs: widget.sourceList.map((source) {
                return SourceTabNameWidget(
                  source: source,
                  isSelected:
                      widget.selectedIndex == widget.sourceList.indexOf(source),
                );
              }).toList(),
            ),
            Expanded(
                child:
                    NewsWidget(source: widget.sourceList[widget.selectedIndex]))
          ],
        ));
  }
}
