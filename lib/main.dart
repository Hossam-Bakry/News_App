import 'package:flutter/material.dart';
import 'package:news_app/Core/styles/themes.dart';
import 'package:news_app/view/category_details_screen/news_details_screen.dart';
import 'package:news_app/view/home_screen/home_screen.dart';
import 'package:news_app/view/web_view/web_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightThem,
      routes: {
        HomeScreen.routeName: (BuildContext context) => HomeScreen(),
        NewsDetailsScreen.routeName: (BuildContext context) =>
            NewsDetailsScreen(),
        WebScreen.routeName: (BuildContext context) => WebScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}

