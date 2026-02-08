import 'package:flutter/material.dart';
import 'package:newsapp/constants.dart';
import 'package:newsapp/json/news_json.dart';

//AppBar
class AppBarElements extends StatelessWidget implements PreferredSizeWidget {
  final String txt;
  const AppBarElements({super.key, required this.txt});
  @override
  Size get preferredSize => const Size.fromHeight(90);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 90,
      title: Padding(
        padding: const EdgeInsets.only(top: paddingValue, left: paddingValue),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(txt, style: TextStyle(fontSize: 28.0, color: primaryColor)),
            const SizedBox(height: 2),
            Text(
              "Today, Feburary 5th",
              style: TextStyle(color: textSecondary, fontSize: 13.0),
            ),
          ],
        ),
      ),

      actions: [
        Padding(
          padding: const EdgeInsets.only(right: paddingValue * 2, top: 12),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: bgWhite,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 1,
                  offset: const Offset(0, 0),
                  color: primaryColor.withValues(alpha: 0.5),
                ),
              ],
            ),
            child: Stack(
              children: [
                Center(
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none, size: 23),
                  ),
                ),

                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
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

//TEXT WITH VIEW MORE
class TextwithViewMore extends StatelessWidget {
  final String text;
  const TextwithViewMore({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: paddingValue * 3,
        vertical: paddingValue,
      ),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              'View More',
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimeandComment extends StatelessWidget {
  final String time, commentNo;
  const TimeandComment({
    super.key,
    required this.time,
    required this.commentNo,
  });

  @override
  Widget build(BuildContext contex) {
    return Row(
      children: [
        Icon(Icons.watch_later_outlined, size: 18, color: textSecondary),
        SizedBox(width: 5),
        Text(time, style: TextStyle(fontSize: 13, color: textSecondary)),
        SizedBox(width: 20),
        Icon(Icons.chat_bubble_outline_rounded, size: 18, color: textSecondary),
        SizedBox(width: 5),
        Text(commentNo, style: TextStyle(fontSize: 13, color: textSecondary)),
      ],
    );
  }
}

// SMALL NEWS CARDS ON HOME SCREEN
class NewsCard extends StatelessWidget {
  final String categoryName, newsText, img, time, commontNo;

  const NewsCard({
    super.key,
    required this.categoryName,
    required this.newsText,
    required this.img,
    required this.time,
    required this.commontNo,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: paddingValue * 3),
      padding: EdgeInsets.all(12),
      height: size.height * 0.18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bgWhite,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(categoryName, style: TextStyle(color: textSecondary)),
                SizedBox(height: 4),
                TextButton(
                  onPressed: () {
                    Map<String, dynamic> selectedNews;
                    if (categoryName == "Technology") {
                      selectedNews = news[2];
                    } else if (categoryName == "Crypto") {
                      selectedNews = news[3];
                    } else {
                      selectedNews = news[0];
                    }
                    Navigator.pushNamed(
                      context,
                      '/newsdetailpage',
                      arguments: selectedNews,
                    );
                  },
                  child: Text(
                    newsText,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: textDark,
                    ),
                  ),
                ),

                Spacer(),
                Row(
                  children: [
                    TimeandComment(time: time, commentNo: commontNo),
                    const Spacer(),
                    Icon(Icons.more_horiz, color: textSecondary),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade300,
              image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}

//NEWS IMAGE
class NewsImage extends StatelessWidget {
  final String img1;
  const NewsImage({super.key, required this.img1});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.4,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: AssetImage(img1), fit: BoxFit.cover),
      ),
    );
  }
}

//DETAIL NEWS PAGE
class DetailNews extends StatelessWidget {
  final String title, source, categoryName, img, description;

  const DetailNews({
    super.key,
    required this.title,
    required this.source,
    required this.categoryName,
    required this.img,
    required this.description,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.justify,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    source,
                    style: TextStyle(
                      color: textDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(categoryName, style: TextStyle(color: textSecondary)),
              ],
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: textDark),
              onPressed: () {},
              child: Text('Follow', style: TextStyle(color: bgWhite)),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: paddingValue * 2),
          child: NewsImage(img1: img),
        ),

        Text(description, textAlign: TextAlign.justify),
      ],
    );
  }
}

//DETAILED NEWS PAGE BOTTOM BAR
class DetailNewsBottomBar extends StatefulWidget {
  final String favoriteNo, commomntNo;

  const DetailNewsBottomBar({
    super.key,
    required this.favoriteNo,
    required this.commomntNo,
  });
  @override
  State<DetailNewsBottomBar> createState() => _DetailNewsBottomBarState();
}

class _DetailNewsBottomBarState extends State<DetailNewsBottomBar> {
  bool isBookMarked = false;
  bool isHeadsetSelected = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_border_rounded, color: textSecondary),
              ),
              Text(widget.favoriteNo, style: TextStyle(color: textSecondary)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.chat_bubble_outline_rounded,
                  color: textSecondary,
                ),
              ),
              Text(widget.commomntNo, style: TextStyle(color: textSecondary)),
            ],
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isHeadsetSelected = !isHeadsetSelected;
              });
            },
            icon: Icon(
              Icons.headset_outlined,
              color: isHeadsetSelected ? primaryColor : textSecondary,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isBookMarked = !isBookMarked;
              });
            },
            icon: Icon(
              Icons.bookmark,
              color: isBookMarked ? primaryColor : textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

// NEWS DETIL ARGUMENTS
class NewsDetailArguments {
  final DetailNews news;
  final DetailNewsBottomBar preference;

  const NewsDetailArguments({required this.news, required this.preference});
}

//POPULAR ACCOUNTS
class PopularAcc extends StatelessWidget {
  final String img, text;

  const PopularAcc({super.key, required this.img, required this.text});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: paddingValue * 3,
        vertical: paddingValue * 2,
      ),
      child: Container(
        width: size.width * 0.25,
        height: size.height * 0.2,
        decoration: BoxDecoration(
          color: secondaryColor.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: paddingValue),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: bgWhite,
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage(img)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(paddingValue * 2),
              child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: textDark),
              onPressed: () {},
              child: Text("Follow", style: TextStyle(color: bgWhite)),
            ),
          ],
        ),
      ),
    );
  }
}

// CATEGORY CARDS
class CategoryCards extends StatelessWidget {
  final String img, text;
  const CategoryCards({super.key, required this.img, required this.text});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: paddingValue * 3,
        vertical: paddingValue * 2,
      ),
      child: Container(
        width: size.width * 0.2,
        height: size.height * 0.15,
        decoration: BoxDecoration(
          color: secondaryColor.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: paddingValue, bottom: paddingValue),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: bgWhite,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: AssetImage(img), scale: 2),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(paddingValue),
              child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

//TITLE
class CategoriesTitle extends StatelessWidget {
  final String title;
  const CategoriesTitle({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: paddingValue * 2),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// Container with title n text

class AboutContainer extends StatelessWidget {
  final String title, text;
  const AboutContainer({super.key, required this.title, required this.text});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        height: size.height * 0.4,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: secondaryColor.withValues(alpha: .2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(paddingValue * 2),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(paddingValue * 2),
                  child: CategoriesTitle(title: title),
                ),
                Text(textAlign: TextAlign.justify, text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
