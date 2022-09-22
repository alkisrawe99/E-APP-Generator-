import 'package:alaatest1/Choice/Product_page_choice.dart';
import 'package:alaatest1/constants.dart';
import 'package:alaatest1/models/user.dart';
import 'package:alaatest1/services/api_product.dart';
import 'package:alaatest1/services/api_selected_product.dart';
import 'package:alaatest1/tabs/home_tab.dart';
import 'package:alaatest1/Choice/user_choice.dart';
import 'package:alaatest1/widgets/custom_action_bar.dart';

import 'package:alaatest1/widgets/product_sizes.dart';
import 'package:alaatest1/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Login_user.dart';
import '../models/product.dart';
import '../services/api_services.dart';
import '../widgets/Sidebar.dart';
import 'login_page.dart';
import 'login_page.dart';

class ProductPage extends StatelessWidget {
  late int productID;
  late String? user_id;

  ProductPage({required this.productID, this.user_id});

  api_services a = api_services();

  LoginPageState k = LoginPageState();


  //FirebaseServices _firebaseServices = FirebaseServices();

  String _selected_product_size = "";
  final api_selected_product httpservice = api_selected_product();
  final api_services apiservice = api_services();

  final SnackBar _snackbar = SnackBar(
    content: Text("product added to cart"),
  );
  final SnackBar _snackbar2 = SnackBar(
    content: Text("product added to save"),
  );

  addtocart()  {
SaveData s= SaveData();
int user_id=s.getId();
    apiservice.Add_to_cart(user_id.toString(), productID.toString());
  }

  addtoSaved() {
    SaveData s= SaveData();
    int user_id=s.getId();
    apiservice.Add_to_save(user_id.toString(), productID.toString());
  }

  HomeTab tab = HomeTab();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: productpagechoice.background_color,
        body: Stack(children: [
      FutureBuilder(
          future: httpservice.getproducts_id(productID),
          builder: (context, AsyncSnapshot<List<product>> index) {
            if (index.hasError) {
              return Scaffold(
                body: Center(
                  child: Text("error ${index.error}"),
                ),
              );
            }
            if (index.connectionState == ConnectionState.done) {
              List<product>? products = index.data;
              if (products != null) {
                return ListView(
                  padding: EdgeInsets.all(0),
                  children: products.map((product product) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 90, left: 25, right: 24, bottom: 4.0),
                      child: Column(
                        children: [
                          CircleAvatar(radius: 200,child:Image.network(fit:BoxFit.cover,a.base_url + "image/" + product.image,width: 400,height: 400,)),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 24),
                            child: Text(
                              product.name,
                              style: TextStyle(
                                  fontSize: productpagechoice.font_size,
                                  color:productpagechoice.font_color,

                                  fontWeight: FontWeight.w600),
                            ),
                          ),Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 24),
                            child: Text(
                              "Price : " +product.price.toString()+"\$" ,
                              style: TextStyle(
                                  fontSize: productpagechoice.font_size,
                                  color:
                                  productpagechoice.font_color,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 24),
                            child: Text(
                              "Description : "+product.dec,
                              style: TextStyle(fontSize: productpagechoice.font_size,color: productpagechoice.font_color,fontWeight: FontWeight.w600),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 24.0, horizontal: 24),
                           /* child: Text(
                              "Select Size",
                              style: Constants.regulardarktext,
                            ),*/
                          ),
                          Padding(
                            padding: const EdgeInsets.all(24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await addtoSaved();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(_snackbar2);
                                  },
                                  child: Container(
                                    width: 65,
                                    height: 65,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: productpagechoice.Button),
                                    child: Icon(color:productpagechoice.icon_color,
                                      Icons.save_rounded,
                                      size: 45,
                                    ),
                                    alignment: Alignment.center,
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async {
                                      await addtocart();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(_snackbar);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(left: 16),
                                      height: 65,
                                      decoration: BoxDecoration(
                                          color: productpagechoice.Button,
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Add to Cart",
                                        style: TextStyle(
                                            color: productpagechoice.font_color,
                                            fontSize: productpagechoice.font_size,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  /*
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 24),
                      child: Text(
                        "${documentData["price"]}\$",
                        style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 24),
                      child: Text(
                        "${documentData["dec"]}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24.0, horizontal: 24),
                      child: Text(
                        "Select Size",
                        style: Constants.regulardarktext,
                      ),
                    ),
                    ProductSizes(
                      productsize: product_sizes,
                      onselected: (size) {
                        _selected_product_size = size;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await addtoSaved();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(_snackbar);
                            },
                            child: Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Userchoice.save_box_color),
                              child: Icon(
                                Icons.save_rounded,
                                size: 45,
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                await addtocart();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(_snackbar);
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 16),
                                height: 65,
                                decoration: BoxDecoration(
                                    color: Userchoice.add_tocart_button_color,
                                    borderRadius: BorderRadius.circular(14)),
                                alignment: Alignment.center,
                                child: Text(
                                  "Add to Cart",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )*/
                );
              }
            }

            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }),
     SafeArea(child:  CustomActionBar(

        hasbackArrow: true,
        hastitle: false,
        hasBackground: false,
      ))
    ]));
  }
}
