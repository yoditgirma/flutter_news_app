import 'package:flutter/material.dart';
import 'package:newsapp/constants.dart';
import 'package:newsapp/json/news_json.dart';
import 'package:newsapp/resused_classes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = [
    "All",
    "Business",
    "Crypto",
    "Technology",
    "Gaming",
    "Science",
    "Sport",
    "Health",
  ];
  int activeCategory = 0;
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: getAppBar(), body: getBody(context));
  }

  // APPBAR
  PreferredSizeWidget getAppBar() {
    return AppBarElements(txt: 'Daily News.');
  }

  Widget getBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(paddingValue * 3),
                child: NewsImage(img1: "images/nasa.png"),
              ),

              Positioned(
                top: 35,
                left: 35,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: textDark),
                  child: Text("Science", style: TextStyle(color: bgWhite)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: paddingValue * 3),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/newsdetailpage',
                  arguments: news[1],
                );
              },
              child: Text(
                "NASA delays astronauts' lunar trip until March after hydrogen leaks mar fueling test",
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: textDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: paddingValue * 3,
              vertical: paddingValue,
            ),
            child: Row(
              children: [
                Text("World", style: TextStyle(color: textSecondary)),
                Spacer(),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: TimeandComment(time: "1hr ago", commentNo: "5"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          TextwithViewMore(text: 'Following'),

          Container(
            height: 40,
            padding: EdgeInsets.only(left: paddingValue * 3),
            margin: EdgeInsets.symmetric(vertical: paddingValue),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(categories.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      activeCategory = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: paddingValue * 2),
                    padding: EdgeInsets.symmetric(
                      horizontal: paddingValue * 2,
                      vertical: paddingValue,
                    ),
                    decoration: BoxDecoration(
                      color: activeCategory == index
                          ? textDark
                          : textSecondary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color: activeCategory == index
                              ? bgWhite
                              : textSecondary,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          NewsCard(
            categoryName: "Technology",
            newsText: "Why you can't have legs in virtual reality (yet)",
            img: "images/VR.png",
            time: "14hrs ago",
            commontNo: "23",
          ),
          const SizedBox(height: 20),
          NewsCard(
            categoryName: "Crypto",
            newsText: "Bitcoin falls to lowest level since Trump took office",
            img: "images/crypto.png",
            time: "18 min ago",
            commontNo: "7",
          ),
        ],
      ),
    );
  }
}
