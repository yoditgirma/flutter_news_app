import 'package:flutter/material.dart';
import 'package:newsapp/constants.dart';
import 'package:newsapp/pages/About.dart';
import 'package:newsapp/pages/categories.dart';
import 'package:newsapp/pages/explore.dart';
import 'package:newsapp/pages/home_page.dart';

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [
        HomePage(),
        ExploreNews(),
        Categories(),
        About(),
      ],
    );
  }

  Widget getFooter() {
    List<IconData> icons = [
      Icons.home_outlined,
      Icons.article_outlined,
      Icons.category_outlined,
      Icons.info_outline,
    ];

    List<String> lables = ["Home", "Explore", "Categories", "About"];
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (index) {
          return Column(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    activeTab = index;
                  });
                },
                icon: Icon(
                  icons[index],
                  color: activeTab == index ? primaryColor : textSecondary,
                ),
              ),
              Text(
                lables[index],
                style: TextStyle(
                  color: activeTab == index ? primaryColor : textSecondary,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
