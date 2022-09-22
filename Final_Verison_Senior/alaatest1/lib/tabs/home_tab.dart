import 'package:alaatest1/Choice/home-tab-choices.dart';
import 'package:alaatest1/constants.dart';
import 'package:alaatest1/models/Login_user.dart';
import 'package:alaatest1/models/product.dart';
import 'package:alaatest1/services/api_selected_product.dart';
import 'package:alaatest1/services/category_api.dart';
import 'package:alaatest1/Choice/user_choice.dart';
import 'package:alaatest1/widgets/Sidebar.dart';
import 'package:alaatest1/widgets/custom_action_bar.dart';
import 'package:alaatest1/widgets/productCard.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:alaatest1/screens/test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:alaatest1/screens/slider.dart';

import '../models/category.dart';
import '../models/sales.dart';
import '../screens/alaatesting.dart';
import '../screens/cart_page.dart';
import '../screens/product_page.dart';
import '../services/api_product.dart';
import '../services/api_services.dart';
import '../widgets/bottom_tabs.dart';



class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  PageController _tabpageController = PageController();

  late int selectedTab = 0;
 int i=1;
  api_services urls = api_services();
  bool x=true;
  final api_product httpservice = api_product();
final SaveData s=SaveData();
  final api_category catservice = api_category();

  Widget buildcard(String ur, String name, int id) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [

           ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                urls.base_url + "image/" + ur,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),

          const SizedBox(height: 20),
          Text('$name ')
        ],
      );
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
backgroundColor: Home_tab_choices.background_color,
      appBar: AppBar(backgroundColor:Userchoice.appbarcolor,
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => cartPage()));
              },
              child: Container(
                width: 40,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Userchoice.cart_color,
                ),
                alignment: Alignment.center,
                child: Icon(Icons.shopping_cart_rounded),
              ),
            ),
          )
        ],
        title: Text("Home"),

      ),

      drawer: NavigationDrawer(),
      bottomNavigationBar: BottomTabs(
        selectedTab: selectedTab,
        tabClicked: (int num) async {
          _tabpageController.animateToPage(num,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeOutCubic);
        },
      ),
      body: Container(

          decoration: const BoxDecoration(
             /* image: DecorationImage(
                  image: NetworkImage("https://images6.alphacoders.com/908/908160.jpg"),
                  fit: BoxFit.fitHeight),*/
                    gradient: LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white12, Colors.white24])),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:Column(
            children: [


              Visibility(child: Slideraa(),visible: Home_tab_choices.slideravaliavble,),




              FutureBuilder(
                  future: urls.getcategory(),
                  builder: (context, AsyncSnapshot<List<category>> index) {
                    if (index.hasError) {
                      return Center(
                        child: Text("error ${index.error}"),
                      );
                    }
                    if (index.connectionState == ConnectionState.done) {
                      List<category>? categories = index.data;

                      if (categories != null) {

                        return

                              SingleChildScrollView(

                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                      children: categories.map((
                                          category category)

                                          {
                                            return GestureDetector(child:
                                         buildcard(
                                            category.img, category.name,
                                            category.id)
                                            ,onTap: (){
                                                s.setname(category.name);
                                              setState(() {

                                              });



                                              },

                                            );
                                      }).toList()));

                     }
                    }
                    return
                     Center(
                        child: CircularProgressIndicator(),
                      );

                  }),


Row(mainAxisAlignment: MainAxisAlignment.center,
    children:[

              SizedBox.fromSize(
                size: Size(75, 75),
                child: ClipOval(
                  child: Material(
                    color: Home_tab_choices.Button,
                    child: InkWell(
                      splashColor: Colors.green,
                      onTap: () {

                        s.setname("all");
                        setState(() {

                        });

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.clear_all), // <-- Icon
                          Text("All"), // <-- Text
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox.fromSize(
                size: Size(75, 75),
                child: ClipOval(
                  child: Material(
                    color: Home_tab_choices.Button,
                    child: InkWell(
                      splashColor: Colors.green,
                      onTap: () {

                        if(x) {
                          SaveData.matrex = 2;
                          x=false;
                        }else{
                          SaveData.matrex = 1;
                        x=true;}
                        setState(() {

                        });

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.apps), // <-- Icon
                          Text("Edit"), // <-- Text
                        ],
                      ),
                    ),
                  ),
                ),
              ),

]),


grid(),


            ],
            ),
          ),

      ),
    );
  }


}
