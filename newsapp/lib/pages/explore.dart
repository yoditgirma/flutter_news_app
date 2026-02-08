import 'package:flutter/material.dart';
import 'package:newsapp/constants.dart';
import 'package:newsapp/resused_classes.dart';

class ExploreNews extends StatelessWidget {
  const ExploreNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: getAppBar(), body: getBody(context));
  }

  PreferredSizeWidget getAppBar() {
    return AppBarElements(txt: 'Explore News.');
  }

  Widget getBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          TextwithViewMore(text: 'Latest'),
          NewsCard(
            categoryName: "Business",
            newsText:
                "Telebirr Excels as Ethio telecom Falls Short of Half-Year Revenue Target",
            img: 'images/business.png',
            time: "10hrs ago",
            commontNo: "4",
          ),
          SizedBox(height: 20),
          NewsCard(
            categoryName: "Sport",
            newsText:
                "Barcelona is the latest top soccer team to abandon European Super League project",
            img: 'images/sport.png',
            time: "23 min ago",
            commontNo: "45",
          ),
          SizedBox(height: 20),
          NewsCard(
            categoryName: "Game",
            newsText: "Mario Tennis Fever, Resident Evil Requiem, and More",
            img: "images/game.png",
            time: "10hrs ago",
            commontNo: "20",
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: paddingValue * 3),
            child: Container(
              padding: EdgeInsets.only(
                left: paddingValue * 2,
                top: paddingValue,
              ),
              height: 40,
              width: size.width,
              decoration: BoxDecoration(color: bgWhite),
              child: Text(
                "Popular Accounts",
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: PopularAcc(img: "images/cnn.png", text: 'CNN'),
              ),
              Expanded(
                child: PopularAcc(img: "images/bbc.png", text: 'BBC'),
              ),
              Expanded(
                child: PopularAcc(img: "images/abc.png", text: 'abc NEWS'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
