import 'package:flutter/material.dart';
import 'package:news_app/Core/styles/themes.dart';
import 'package:news_app/view/home_screen/home_screen.dart';

class SettingScreen extends StatefulWidget {
  static const String routeName = 'setting screen';

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String? valueSelectetd;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> languageList = ['English', 'العربية'];
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
          appBar: AppBar(
            title: const Text(
              'Settings',
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
            iconTheme: const IconThemeData(
              size: 28,
              color: Colors.white,
            ),
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
                    Navigator.pushNamed(context, HomeScreen.routeName);
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
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, SettingScreen.routeName);
                  },
                  child: Container(
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
                ),
              ],
            ),
          ),
          body: Container(
            margin: const EdgeInsets.all(25),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Language',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: MyTheme.primaryColor,
                    ),
                    color: Colors.white,
                  ),
                  child: DropdownButton(
                    style: const TextStyle(
                      fontSize: 14,
                      color: MyTheme.primaryColor,
                    ),
                    underline: const SizedBox(),
                    iconSize: 28.0,
                    iconEnabledColor: MyTheme.primaryColor,
                    alignment: Alignment.bottomCenter,
                    hint: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'English',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 14,
                            color: MyTheme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                    isExpanded: true,
                    items: languageList
                        .map(
                          (value) => DropdownMenuItem(
                            child: Text(value),
                            value: value,
                          ),
                        )
                        .toList(),
                    onChanged: (String? newValue) {
                      valueSelectetd = newValue;
                      if (valueSelectetd == 'English') {
                      } else {}
                    },
                    value: valueSelectetd,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
