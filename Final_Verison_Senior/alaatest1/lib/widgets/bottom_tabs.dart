import 'package:alaatest1/Choice/home-tab-choices.dart';
import 'package:alaatest1/screens/login_page.dart';
import 'package:alaatest1/tabs/home_tab.dart';
import 'package:alaatest1/tabs/saved_tab.dart';
import 'package:alaatest1/tabs/search_tab.dart';
import 'package:flutter/material.dart';
import 'package:alaatest1/Choice/user_choice.dart';
LoginPageState astate=LoginPageState();
class BottomTabs extends StatefulWidget {

  final int? selectedTab;
  final Function(int) tabClicked;
  BottomTabs({this.selectedTab,required this.tabClicked});
  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
 late int selectedtab;


  @override
  Widget build(BuildContext context) {
    selectedtab=widget.selectedTab??0;
    return Container(
        decoration: BoxDecoration(
            color: Userchoice.bot_color,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0.5,
                  blurRadius: 30.0)
            ]),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          BottomTapbtn(
              icon: Icons.home_rounded,
              seleted: selectedtab == 0 ? true : false,
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeTab()));
                widget.tabClicked(0);
              }),
          BottomTapbtn(
              icon: Icons.search_outlined,
              seleted: selectedtab == 1 ? true : false,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Searchtab()));
                widget.tabClicked(1);

              }),


          BottomTapbtn(
              icon: Icons.save_rounded,
              seleted: selectedtab == 2 ? true : false,
              onPressed: () {
                widget.tabClicked(2);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Saved_tab()));
              }),


          BottomTapbtn(
              icon: Icons.logout_rounded,
              seleted: selectedtab == 3 ? true : false,
              onPressed: () {astate.logged_in=false;

                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
              }),
        ]));
  }
}

class BottomTapbtn extends StatelessWidget {
  final IconData icon;
  final bool? seleted;
  final Function onPressed;
  BottomTapbtn({required this.icon, this.seleted, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    bool _selected = seleted ?? false;
    return  Container(
      padding: EdgeInsets.symmetric(vertical: 16.0,horizontal:0.5 ),


      child: MaterialButton(minWidth:100.0,height: 100.0,onPressed: (){onPressed();},
        child: Icon(color:Home_tab_choices.icon_color,
          icon,
          size: Userchoice.icon_size,
        ),
      ),

      width: 50.0,
      height: 60.0,
     /* foregroundDecoration: BoxDecoration( shape: BoxShape.rectangle,
          color: _selected
              ? Theme.of(context).colorScheme.secondary.withOpacity(0.1)
              : Colors.transparent),*/


    );
  }
}
