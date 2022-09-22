import 'package:alaatest1/screens/login_page.dart';
import 'package:alaatest1/services/api_services.dart';
import 'package:alaatest1/tabs/home_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../models/user.dart';
import '../screens/Contact_us.dart';
import '../screens/history_page.dart';
import '../Choice/SiderBar_C.dart';
api_services AS=api_services();
LoginPageState astate=LoginPageState();
class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [buildheader(context), buildMenuItems(context)],
        ),
      ),
    );
  }

  Widget buildheader(BuildContext context) =>Container(child: FutureBuilder(
    future: AS.getusers(),
    builder: (context, AsyncSnapshot<List<user>> snapshot) {
      if (snapshot.hasError) {
        return Scaffold(
          body: Center(
            child: Text("error ${snapshot.error}"),
          ),
        );
      }
      if (snapshot.connectionState == ConnectionState.done) {
        List<user>? users = snapshot.data;

        if (users != null) {
          return Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                                  children:users.map((user user){
                                 return   Column(
                                     children:[   Icon(size:100,Icons.person,color: SideBar_C.icon_color),

                                     Row( mainAxisAlignment: MainAxisAlignment.center,
                                         children:[  Icon(size:SideBar_C.icon_size,Icons.email,color: SideBar_C.icon_color),
                                       Text(user.email,style:TextStyle(color: SideBar_C.font_color)),]),

                                       Row( mainAxisAlignment: MainAxisAlignment.center,
                                           children:[  Icon(size:SideBar_C.icon_size,Icons.money_off,color: SideBar_C.icon_color),
                                             Text(user.credits.toString(),style:TextStyle(color: SideBar_C.font_color)),]),


                                       Row( mainAxisAlignment: MainAxisAlignment.center,
                                           children:[  Icon(size:SideBar_C.icon_size,Icons.add_location,color: SideBar_C.icon_color),
                                             Text(user.location,style:TextStyle(color:SideBar_C.font_color))]),

                                       Divider(height: 5,color:SideBar_C.font_color,),



]);
                                  }


                                  ).toList()

          )
          );
        }
      }

      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    },
  ),);


  Widget buildMenuItems(BuildContext context) => Container(
    color:SideBar_C.background_color,
    child:

    Padding(padding:EdgeInsets.only(top:20 ),child: Wrap(runSpacing: 5,
        children: [
          ListTile(
            leading:  Icon(size:(SideBar_C.icon_size),Icons.home_outlined,color: SideBar_C.icon_color),
            title: Text("Home",style: TextStyle(color: SideBar_C.font_color)),
            onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeTab()));},
          ),
          Divider(height: 10,color: SideBar_C.font_color,),
          ListTile(
            leading:  Icon(size:(SideBar_C.icon_size),Icons.history,color: SideBar_C.icon_color),
            title: Text("History",style: TextStyle(color: SideBar_C.font_color)),
            onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>history_page()));},
          ),
          Divider(height: 10,color: SideBar_C.font_color,),
          ListTile(
            leading:  Icon(size:(SideBar_C.icon_size),Icons.logout_outlined,color: SideBar_C.icon_color),
            title: Text("Logout",style: TextStyle(color: SideBar_C.font_color) ,),
            onTap: () {astate.logged_in=false;Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));},
          ),
          Divider(height: 10,color:SideBar_C.font_color,),
          ListTile(
            leading:  Icon(size:(SideBar_C.icon_size),Icons.phone,color: SideBar_C.icon_color,),
            title: Text("Contact us",style: TextStyle(color: SideBar_C.font_color)),
            onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Contact_us())); },
          ),
        ],
  ),
      ),
  );

}

