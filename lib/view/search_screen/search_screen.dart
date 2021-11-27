import 'package:flutter/material.dart';
import 'package:news_app/Core/styles/themes.dart';
import 'package:news_app/model/api/api_methods.dart';
import 'package:news_app/model/api/news_response_model.dart';
import 'package:news_app/view/category_details_screen/news_item_widget.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'search screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchKey = '';
  List<News> newsList = [];

  // TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional(0, size.height * 0.0005),
                children: [
                  Container(
                    width: double.infinity,
                    height: size.height * 0.14,
                    decoration: const BoxDecoration(
                      color: MyTheme.primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(45),
                        bottomLeft: Radius.circular(45),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 40, right: 40, top: 15),
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 20, bottom: 2),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        prefixIcon: Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.close,
                              size: 28,
                              color: MyTheme.primaryColor,
                            ),
                          ),
                        ),
                        suffixIcon: Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: const ImageIcon(
                            AssetImage('assets/images/ic_search.png'),
                            size: 20,
                            color: MyTheme.primaryColor,
                          ),
                        ),
                        suffixIconConstraints:
                            const BoxConstraints(maxWidth: 50),
                        hintText: 'search articles',
                        hintStyle: TextStyle(
                            fontSize: 16,
                            color: MyTheme.primaryColor.withOpacity(0.5)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: MyTheme.primaryColor,
                          ),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          searchKey = value ?? '';
                        });
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return NewsItemWidget(
                      search().elementAt(index),
                    );
                  },
                  itemCount: search().length,
                ),
              ),
              // FutureBuilder(
              //   future: ApiMethods.loadNews(
              //     query: searchKey,
              //   ),
              //   builder: (BuildContext ontext, AsyncSnapshot<NewsResponse> snapshot) {
              //     if (snapshot.hasError) {
              //       //Todo : in case error retry
              //       return Center(child: Text(snapshot.error.toString()));
              //     } else if (snapshot.connectionState == ConnectionState.waiting) {
              //       return const Center(
              //         child: CircularProgressIndicator(
              //           color: MyTheme.primaryColor,
              //         ),
              //       );
              //     } else {
              //       return Expanded(
              //         child: ListView.builder(
              //           itemBuilder: (BuildContext context, int index) {
              //             return NewsItemWidget(
              //               snapshot.data!.articles!.elementAt(index),
              //             );
              //           },
              //           itemCount: snapshot.data?.articles?.length ?? 0,
              //         ),
              //       );
              //     }
              //   },
              // ),
            ],
          ),
        ),
      ],
    );
  }

  List search() {
    ApiMethods.loadNews(query: searchKey).then((value) {
      newsList = value.articles ?? [];
    }).catchError((error) {
      print(' error => ${error.toString()}');
    });
    return newsList;
  }
}
