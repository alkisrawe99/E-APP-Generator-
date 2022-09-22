import 'package:alaatest1/Tabs/home_tab.dart';
import 'package:alaatest1/Tabs/saved_tab.dart';
import 'package:alaatest1/Tabs/search_tab.dart';
import 'package:alaatest1/constants.dart';
import 'package:alaatest1/screens/login_page.dart';
import 'package:alaatest1/Choice/user_choice.dart';
import 'package:alaatest1/widgets/bottom_tabs.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

import '../widgets/custom_action_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _tabpageController = PageController();
  int selectedTab = 0;
  LoginPageState s=LoginPageState();
  @override
  void initState() {
    super.initState();
    s.read();
    _tabpageController = PageController();

  }

  @override
  void dispose() {

      super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: PageView(
            controller: _tabpageController,
            onPageChanged: (num) {
              setState(() {
                selectedTab = num;
              });
            },
            children: [
              HomeTab(),
              Searchtab(),
              Saved_tab(),


            ],
          ),
        ),






      ],
    ));
  }
}
