import 'package:alaatest1/models/category.dart';
import 'package:alaatest1/screens/alaatesting.dart';
import 'package:alaatest1/screens/login_page.dart';
import 'package:alaatest1/screens/rigister.dart';
import 'package:alaatest1/tabs/home_tab.dart';
import 'package:alaatest1/tabs/search_tab.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
LoginPageState astate=LoginPageState();
void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
          textTheme:GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,

          ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFFF1E00))
      ),

      home: astate.logged_in?HomeTab():LoginPage(),
    );
  }
}
