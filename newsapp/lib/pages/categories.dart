import 'package:flutter/material.dart';
import 'package:newsapp/constants.dart';
import 'package:newsapp/resused_classes.dart';

class Categories extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {"img": "images/dna.png", "text": "Science"},
    {"img": "images/bulb.png", "text": "Technology"},
    {"img": "images/graph.png", "text": "Buisness"},
    {"img": "images/ps.png", "text": "Gaming"},
    {"img": "images/yoga.png", "text": "Health"},
    {"img": "images/money.png", "text": "Finance"},
    {"img": "images/design.png", "text": "Design"},
    {"img": "images/gym.png", "text": "Fitness"},
    {"img": "images/lstyle.png", "text": "LifeStyle"},
  ];

  Categories({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: getAppBar(), body: getBody());
  }

  PreferredSizeWidget getAppBar() {
    return AppBarElements(txt: "Categories.");
  }

  Widget getBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: paddingValue * 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What interests you?",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Text(
            "Follow Topic to influence you the stories you see",
            style: TextStyle(color: textSecondary),
          ),
          CategoriesTitle(title: "Recommendation"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CategoryCards(img: "images/coin.png", text: "Crypto"),
              CategoryCards(img: "images/plane.png", text: "Travel"),
              CategoryCards(img: "images/ball.png", text: "Sports"),
            ],
          ),
          CategoriesTitle(title: "All Topics"),

          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryCards(
                  img: categories[index]["img"]!,
                  text: categories[index]["text"]!,
                );
              },
            ),
          ),

          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: textDark),
              onPressed: () {},
              child: Text("Build My Feed", style: TextStyle(color: bgWhite)),
            ),
          ),
        ],
      ),
    );
  }
}
