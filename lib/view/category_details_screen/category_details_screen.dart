import 'package:flutter/material.dart';
import 'package:news_app/Core/styles/themes.dart';
import 'package:news_app/model/api/api_methods.dart';
import 'package:news_app/model/api/source_responce_model.dart';
import 'package:news_app/view/category_details_screen/sources_tab_widget.dart';
import 'package:news_app/view/home_screen/widgets/categories_widget.dart';

class CategoryDetailsScreen extends StatelessWidget {
  Category category;

  CategoryDetailsScreen(this.category);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<SourceResponce>(
        future: ApiMethods.loadNewsSourses(category.categoryId),
        builder:
            (BuildContext context, AsyncSnapshot<SourceResponce> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: MyTheme.primaryColor,
              ),
            );
          } else {
            return SourceTabWidget(snapshot.data?.sources ?? []);
          }
        },
      ),
    );
  }
}
