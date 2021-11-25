import 'package:flutter/material.dart';
import 'package:news_app/Core/styles/themes.dart';
import 'package:news_app/view/category_details_screen/category_details_screen.dart';
import 'package:news_app/view/home_screen/widgets/categories_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Category? selectedCategory = null;

  List<Category> category = [
    Category(
      'Sports',
      'Sports',
      'assets/images/sports.png',
      const Color.fromRGBO(201, 28, 34, 1.0),
    ),
    Category(
      'Politics',
      'Politics',
      'assets/images/politics.png',
      const Color.fromRGBO(0, 62, 144, 1.0),
    ),
    Category(
      'Health',
      'Health',
      'assets/images/health.png',
      const Color.fromRGBO(237, 30, 121, 1.0),
    ),
    Category(
      'Business',
      'Business',
      'assets/images/buisness.png',
      const Color.fromRGBO(207, 126, 72, 1.0),
    ),
    Category(
      'Enviroment',
      'Enviroment',
      'assets/images/environment.png',
      const Color.fromRGBO(72, 130, 207, 1.0),
    ),
    Category(
      'Science',
      'Science',
      'assets/images/science.png',
      const Color.fromRGBO(242, 211, 82, 1.0),
    ),
  ];

  int currentIndex = 0;
  List<Widget> screens = [];

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
          appBar: AppBar(
            iconTheme: const IconThemeData(size: 30, color: Colors.white),
            title: const Text(
              'News Title',
              style: TextStyle(fontSize: 22.0, color: Colors.white),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(45),
                  bottomRight: Radius.circular(45)),
            ),
            toolbarHeight: size.height * 0.08,
            centerTitle: true,
            leadingWidth: 100,
            actions: [
              selectedCategory == null
                  ? SizedBox(width: size.width * 0.1)
                  : IconButton(
                      onPressed: () {},
                      icon: const ImageIcon(
                        AssetImage('assets/images/ic_search.png'),
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
              const SizedBox(width: 20)
            ],
          ),
          drawer: Drawer(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: size.height * 0.16,
                  color: MyTheme.primaryColor,
                  child: const Center(
                    child: Text(
                      'News App',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedCategory = null;
                      Navigator.pop(context);
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 15, top: 20),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.list,
                          size: 34,
                        ),
                        SizedBox(width: 15),
                        Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15, top: 8),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.settings,
                        size: 34,
                      ),
                      SizedBox(width: 15),
                      Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              selectedCategory == null
                  ? Expanded(
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Pick your category \n of interest',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(79, 90, 105, 1.0),
                              ),
                            ),
                            Expanded(
                              child: GridView.builder(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                  childAspectRatio: 6 / 7,
                                ),
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        CategoriesGridWidget(
                                            category[index], index, onClick),
                                itemCount: category.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : CategoryDetailsScreen(selectedCategory!),
            ],
          ),
        ),
      ],
    );
  }

  void onClick(Category category) {
    setState(() {
      selectedCategory = category;
    });
  }
}
