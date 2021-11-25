import 'package:flutter/material.dart';
import 'package:news_app/model/api/news_response_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScreen extends StatefulWidget {
  const WebScreen({Key? key}) : super(key: key);
  static const String routeName = 'web screen';

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  @override
  Widget build(BuildContext context) {
    News news = ModalRoute.of(context)!.settings.arguments as News;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
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
      body: WebView(
        initialUrl: news.url,
      ),
    );
  }
}
