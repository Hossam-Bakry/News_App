import 'package:flutter/material.dart';
import 'package:news_app/Core/styles/themes.dart';
import 'package:news_app/model/api/source_responce_model.dart';

class TabItem extends StatelessWidget {
  Sources source;
  bool isSelected;

  TabItem(this.source, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: MyTheme.primaryColor, width: 2),
        color: isSelected ? MyTheme.primaryColor : Colors.white,
      ),
      child: Text(
        source.name ?? '',
        style: TextStyle(
          fontSize: 15,
          color: isSelected ? Colors.white : MyTheme.primaryColor,
        ),
      ),
    );
  }
}
