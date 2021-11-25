import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/model/api/news_response_model.dart';
import 'package:news_app/view/web_view/web_screen.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const String routeName = 'news details screen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    News news = ModalRoute.of(context)!.settings.arguments as News;
    var publishedDate = DateTime.parse(news.publishedAt ?? '');

    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            'assets/images/background.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text(
              'News Title',
              style: TextStyle(fontSize: 22.0, color: Colors.white),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(45),
                  bottomRight: Radius.circular(45)),
            ),
            toolbarHeight: size.height * 0.075,
            centerTitle: true,
            leadingWidth: 100,
          ),
          body: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      child: Image.network(news.urlToImage ?? ''),
                      borderRadius: BorderRadius.circular(15),
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
                      margin: const EdgeInsets.only(right: 5, top: 5),
                      child: Text(
                        '${showPublishedAt(publishedDate, news)}',
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(121, 130, 139, 1.0),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 8,
                      ),
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      // height: size.height * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Text(
                            news.description ?? '',
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 15),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, WebScreen.routeName,
                                    arguments: news);
                                print(news.url);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text(
                                    'View Full Article',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.play_arrow,
                                    size: 22,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  showPublishedAt(DateTime publishedAt, News news) {
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
