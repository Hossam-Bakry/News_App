import 'package:flutter/material.dart';
import 'package:news_app/model/api/source_responce_model.dart';
import 'package:news_app/view/category_details_screen/news_list_widget.dart';
import 'package:news_app/view/category_details_screen/tab_item.dart';

class SourceTabWidget extends StatefulWidget {
  List<Sources> source;

  SourceTabWidget(this.source);

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.source.length,
      child: Column(
        children: [
          TabBar(
            labelPadding: const EdgeInsets.symmetric(horizontal: 4),
            indicator: const BoxDecoration(
              border: Border(
                bottom: BorderSide.none,
              ),
            ),
            isScrollable: true,
            onTap: (int index) {
              selectedIndex = index;
              setState(() {});
            },
            tabs: widget.source
                .map((element) => TabItem(
                    element, selectedIndex == widget.source.indexOf(element)))
                .toList(),
          ),
          NewsListWidget(
            source: widget.source[selectedIndex],
          ),
        ],
      ),
    );
  }
}
