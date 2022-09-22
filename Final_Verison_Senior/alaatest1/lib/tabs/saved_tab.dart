
import 'package:alaatest1/Choice/saved-tab-choices.dart';
import 'package:alaatest1/screens/product_page.dart';
import 'package:alaatest1/widgets/custom_action_bar.dart';
import 'package:alaatest1/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

import '../models/get_item_id.dart';
import '../models/product.dart';
import '../services/api_product.dart';
import '../widgets/Sidebar.dart';
import '../widgets/bottom_tabs.dart';
import '../widgets/custom_action_bar.dart';
import '../widgets/custom_button.dart';
final api_products_save httpservice = api_products_save();
remove r=remove();
get_item_id s2 =get_item_id();

class Saved_tab extends StatefulWidget {
  const Saved_tab({Key? key}) : super(key: key);

  @override
  State<Saved_tab> createState() => _SavedtabState();
}

class _SavedtabState extends State<Saved_tab> {

  @override
  Widget build(BuildContext context) {
    var userRef;
    return Scaffold(bottomNavigationBar: BottomTabs(tabClicked: (int x){},),
      body: Stack(
        children: [
          FutureBuilder(
            future: httpservice.getproducts_save(),
            builder: (context, AsyncSnapshot<List<product>>  snapshot) {
              if (snapshot.hasError) {
                return Scaffold(drawer: NavigationDrawer(),
                  body: Center(
                    child: Text("error ${snapshot.error}",style: TextStyle(fontSize: Saved_tab_choice.font_size,color: Saved_tab_choice.font_color),),
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.done)
              {                List<product>? products = snapshot.data;

              if (products != null) {
                return ListView(
                  padding: EdgeInsets.only(top: 100.0, bottom: 12.0),
                  children: products.map((product product) {
                    return GestureDetector(
                      /* onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProductPage(productID: 23,
                            //  productID: document.id,
                          )));
            },*/

                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 90,
                                height: 90,
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(8.0),
                                  child: Image.network(
                                    "${a.base_url + "image/" + product.image}",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${product.name}",
                                      style: TextStyle(
                                          fontSize: Saved_tab_choice.font_size,
                                          color: Saved_tab_choice.font_color,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4.0),
                                      child: Text(
                                        "${product.price}",
                                        style: TextStyle(
                                            fontSize: Saved_tab_choice.font_size,
                                            color: Saved_tab_choice.font_color,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Text(
                                      "Size: ${product.size}",
                                      style: TextStyle(
                                          fontSize: Saved_tab_choice.font_size,
                                          color: Saved_tab_choice.font_color,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Custombtn( c: Saved_tab_choice.Button,
                                      onpressed: ()
              async {
              await s2.setid_item(product.id);
                                        r.delete_save();
                                        Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Saved_tab()));
                                      }, text: "remove",)


                                  ],

                                ),

                              ),


                            ],
                          ),


                        )





                    );


                  } ).toList(),

                );

              }
              }




              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
         SafeArea(child:  CustomActionBar(

            hasbackArrow: true,
            title: "Saved Products",
          ),)

        ],
      ),
    );
  }
}
