import 'package:flutter/material.dart';
import 'package:newsapp/constants.dart';
import 'package:newsapp/resused_classes.dart';

class About extends StatelessWidget {
  const About({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getBody(context));
  }

  Widget getBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(paddingValue * 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300,
                image: DecorationImage(
                  image: AssetImage("images/dailynews.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Center(
            child: Padding(
              padding: EdgeInsets.only(top: paddingValue * 2),
              child: Text(
                "Your daily source of trusted news",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                  color: textSecondary,
                ),
              ),
            ),
          ),

          CategoriesTitle(title: "About Daily Life"),

          Text(
            "Daily News brings you the latest updates from technology, sports, entertainment, science, and more — all in one place. The app is designed to deliver clean, fast, and reliable news with a simple and user-friendly interface, making it easy to stay informed anytime, anywhere.",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 15),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: paddingValue * 3),
              child: Row(
                children: [
                  AboutContainer(
                    title: "Goal",
                    text:
                        "The goal of Daily News is to provide users with quick, easy, and reliable access to daily news from multiple categories through a clean and user-friendly interface.",
                  ),
                  SizedBox(width: paddingValue * 3),
                  AboutContainer(
                    title: "Key Features",
                    text:
                        "1. Latest news updates\n2. Category-based browsing\n3. Explore trending topics\n4. Fast and lightweight",
                  ),
                ],
              ),
            ),
          ),
          Container(
            // padding: EdgeInsets.all(paddingValue),
            decoration: BoxDecoration(color: bgWhite),
            // height: 50,
            width: size.width,
            child: Text(
              textAlign: TextAlign.center,
              "App Version: 2.3\nPlatform: Flutter\nBuild Type: UI Only",
              style: TextStyle(color: textSecondary, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
