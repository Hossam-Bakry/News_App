import 'package:flutter/material.dart';
import 'package:news_app/Core/styles/themes.dart';
import 'package:news_app/model/api/api_methods.dart';
import 'package:news_app/model/api/news_response_model.dart';
import 'package:news_app/model/api/source_responce_model.dart';
import 'package:news_app/view/category_details_screen/news_item_widget.dart';

class NewsListWidget extends StatelessWidget {
  Sources? source;
  String? query;

  NewsListWidget({this.source, this.query});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiMethods.loadNews(
        source: source?.id,
        query: query,
      ),
      builder: (BuildContext context, AsyncSnapshot<NewsResponse> snapshot) {
        if (snapshot.hasError) {
          //Todo : in case error retry
          return Center(child: Text(snapshot.error.toString()));
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: MyTheme.primaryColor,
            ),
          );
        } else {
          return Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return NewsItemWidget(
                  snapshot.data!.articles!.elementAt(index),
                );
              },
              itemCount: snapshot.data?.articles?.length ?? 0,
            ),
          );
        }
      },
    );
  }
}
