import 'package:flutter/material.dart';
import 'package:news_app/Core/styles/themes.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.16,
            color: MyTheme.primaryColor,
            child: const Center(
              child: Text(
                'News App!',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Container(
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
    );
  }
}
