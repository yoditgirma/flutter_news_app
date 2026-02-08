import 'package:flutter/material.dart';
import 'package:newsapp/resused_classes.dart';

class About extends StatelessWidget {
  const About({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      // body: getBody()
    );
  }

  PreferredSizeWidget getAppBar() {
    return AppBarElements(txt: "About Daily News");
  }
}
