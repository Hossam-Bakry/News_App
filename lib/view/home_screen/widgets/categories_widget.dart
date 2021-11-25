import 'package:flutter/material.dart';

class CategoriesGridWidget extends StatelessWidget {
  Category category;
  int index;
  Function onClickItem;

  CategoriesGridWidget(this.category, this.index, this.onClickItem);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClickItem(category);
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: category.background,
          borderRadius: BorderRadius.only(
            topRight: const Radius.circular(25),
            topLeft: const Radius.circular(25),
            bottomLeft: Radius.circular(index % 2 == 0 ? 25 : 0),
            bottomRight: Radius.circular(index % 2 == 0 ? 0 : 25),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              category.imagePath,
              height: 120,
            ),
            Text(
              category.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Category {
  String categoryId;
  String title;
  String imagePath;
  Color background;

  Category(this.categoryId, this.title, this.imagePath, this.background);
}
