import 'package:flutter/material.dart';
import 'package:news_app/Core/styles/themes.dart';
import 'package:news_app/view/home_screen.dart';

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
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}

