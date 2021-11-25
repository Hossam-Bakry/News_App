import 'package:flutter/material.dart';
import 'package:news_app/Core/styles/themes.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      alignment: AlignmentDirectional(0, size.height * 0.0005),
      children: [
        Container(
          width: double.infinity,
          height: size.height / 7,
          decoration: const BoxDecoration(
            color: MyTheme.primaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(45),
              bottomLeft: Radius.circular(45),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                size: 34,
                color: Colors.white,
              ), //your button
            ),
            const Text(
              'News App',
              style: TextStyle(fontSize: 22.0, color: Colors.white),
            ),
            const IconButton(
              onPressed: null,
              icon: ImageIcon(
                AssetImage('assets/images/ic_search.png'),
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
