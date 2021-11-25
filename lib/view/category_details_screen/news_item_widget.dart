import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/model/api/news_response_model.dart';
import 'package:news_app/view/category_details_screen/news_details_screen.dart';

class NewsItemWidget extends StatelessWidget {
  News news;

  NewsItemWidget(this.news);

  @override
  Widget build(BuildContext context) {
    DateTime publishedDate = DateTime.parse(news.publishedAt ?? '');

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsDetailsScreen.routeName,
            arguments: news);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 0, bottom: 10, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: Image.network(news.urlToImage ?? ''),
              borderRadius: BorderRadius.circular(10),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                news.source?.name ?? ' ',
                style: const TextStyle(
                  fontSize: 15,
                  color: Color.fromRGBO(121, 130, 139, 1.0),
                ),
              ),
            ),
            Text(
              news.title ?? '',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              alignment: AlignmentDirectional.centerEnd,
              margin: const EdgeInsets.only(right: 5),
              child: Text(
                '${showPublishedAt(publishedDate)}',
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color.fromRGBO(121, 130, 139, 1.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showPublishedAt(DateTime publishedAt) {
    var dateTimeNow = DateTime.now();
    var diffrence = dateTimeNow
        .difference(DateTime.parse(news.publishedAt ?? ''))
        .inMinutes;

    if (diffrence < 0) {
      diffrence = dateTimeNow
          .difference(DateTime.parse(news.publishedAt ?? ''))
          .inSeconds;
      return '$diffrence seconds ago';
    } else if (diffrence > 0 && diffrence < 60) {
      diffrence = dateTimeNow
          .difference(DateTime.parse(news.publishedAt ?? ''))
          .inMinutes;
      return '$diffrence minutes ago';
    } else if (diffrence > 60 && diffrence < 1440) {
      diffrence = dateTimeNow
          .difference(DateTime.parse(news.publishedAt ?? ''))
          .inHours;
      return '$diffrence hours ago';
    } else if (diffrence > 1440 && diffrence < 44640) {
      diffrence =
          dateTimeNow.difference(DateTime.parse(news.publishedAt ?? '')).inDays;
      return '$diffrence days ago';
    } else {
      return DateFormat.yMMMd().format(DateTime.parse(news.publishedAt ?? ''));
    }
  }
}
