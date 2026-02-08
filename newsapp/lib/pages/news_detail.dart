import 'package:flutter/material.dart';
import 'package:newsapp/constants.dart';
import 'package:newsapp/resused_classes.dart';

class NewsDetail extends StatefulWidget {
  const NewsDetail({super.key});

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  Map<String, dynamic> newsData = {};
  bool isBookMarked = false;
  bool isHeadsetSelected = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(context),
      bottomNavigationBar: getBottomBar(),
    );
  }

  PreferredSizeWidget getAppBar() {
    return AppBar(
      shadowColor: Colors.black.withValues(alpha: 0.3),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.ios_share_outlined, size: 20),
        ),

        IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
      ],
    );
  }

  Widget getBody(BuildContext context) {
    final receivedData = ModalRoute.of(context)?.settings.arguments;

    if (receivedData != null && receivedData is Map<String, dynamic>) {
      setState(() {
        newsData = receivedData;
      });
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: paddingValue * 3,
            vertical: paddingValue,
          ),
          child: DetailNews(
            title: receivedData['title'] ?? '',
            source: receivedData['source'] ?? 'Unknown Source',
            categoryName: receivedData['categoryName'] ?? 'General',
            img: receivedData['img'] ?? '',
            description: receivedData['description'] ?? '',
          ),
        ),
      );
    } else {
      return Center(
        child: Text('No news data found', style: TextStyle(color: textDark)),
      );
    }
  }

  Widget getBottomBar() {
    return DetailNewsBottomBar(
      favoriteNo: newsData['favoriteNo'] ?? "0",
      commomntNo: newsData['commontNo'] ?? "0",
    );
  }
}
