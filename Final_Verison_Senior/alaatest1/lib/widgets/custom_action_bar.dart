import 'package:alaatest1/constants.dart';
import 'package:alaatest1/screens/rigister.dart';
import 'package:alaatest1/tabs/home_tab.dart';
import 'package:alaatest1/Choice/user_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/product.dart';
import '../screens/cart_page.dart';
import '../services/api_product.dart';


class CustomActionBar extends StatelessWidget {
  final String? title;
  final bool? hasbackArrow;
  final bool? hastitle;
  final bool? hasBackground;
  int? total_items;
  final api_products_cart httpservice = api_products_cart();

  CustomActionBar(
      {this.title, this.hasbackArrow, this.hastitle, this.hasBackground});


  @override
  Widget build(BuildContext context) {
    bool _hasbackArrow = hasbackArrow ?? false;
    bool _hastitle = hastitle ?? true;
    bool _hasBackground = hasBackground ?? true;

    //FirebaseServices _firebaseServices=FirebaseServices();
    // final CollectionReference _userRef =
    // FirebaseFirestore.instance.collection("Users");


    return Container(
      decoration: BoxDecoration(
          gradient: _hasBackground
              ? LinearGradient(
              colors: [Colors.white, Colors.white.withOpacity(0)],
              begin: Alignment(0, 0),
              end: Alignment(0, 1))
              : null),
      padding: EdgeInsets.only(
        top: 10.0,
        left: 24.0,
        right: 24.0,
        bottom: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_hasbackArrow)
            GestureDetector(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeTab()));

            },
              child: Container(
                  width: 42.0,
                  height: 42.0,
                  decoration: BoxDecoration(color:Userchoice.back_button_color,
                    borderRadius: BorderRadius.circular(8.0),

                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.reply,
                    color: Colors.red,
                  )),
            ),
          if (_hastitle)
            Text(
              title ?? "",
              style: Constants.boldheading,
            ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>cartPage()));
            },
            child: Container(
              width: 42.0,
              height: 42.0,
              decoration: BoxDecoration(color: Userchoice.cart_color,
                borderRadius: BorderRadius.circular(8.0),

              ),
              alignment: Alignment.center,


               child:  Icon(Icons.shopping_cart,

               )


              ),
            ),

        ],
      ),
    );
  }
}
