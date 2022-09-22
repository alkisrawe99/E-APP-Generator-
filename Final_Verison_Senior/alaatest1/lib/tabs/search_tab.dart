
import 'dart:convert';

import 'package:alaatest1/Choice/search_tab_choices.dart';
import 'package:alaatest1/constants.dart';
import 'package:alaatest1/services/api_services.dart';
import 'package:alaatest1/widgets/bottom_tabs.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/product.dart';
import '../widgets/Sidebar.dart';
import '../widgets/custom_action_bar.dart';
import '../widgets/custom_input.dart';
import '../widgets/productCard.dart';
import"package:http/http.dart" as http;
api_services a=api_services();
class Searchtab extends StatefulWidget {
  @override
  State<Searchtab> createState() => _SearchtabState();
}

class _SearchtabState extends State<Searchtab> {


   String _searchString="";
 api_services httpservice=api_services();

  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: BottomTabs(tabClicked: (int x){},),
      body: Container(
          child: Stack(
        children: [
          if(_searchString.isEmpty)
            Center(child: Container( child: Text("search Result",style: Constants.regulardarktext,)))
          else
            FutureBuilder(
              future: httpservice.getsearchresult(_searchString),
            builder: (context, AsyncSnapshot<List<product>> snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("error ${snapshot.error}"),
                  ),
                );
              }
              if (snapshot.connectionState == ConnectionState.done) {
                List<product>? products = snapshot.data;
                if (products != null) {
                  return Scaffold(
                    body: ListView(
                      padding: EdgeInsets.only(top: 100.0, bottom: 12.0),
                      children: products.map((product product) {
                        return productCard(
                          title: product.name,
                          imgUrl: (a.base_url+"image/" +
                              product.image),
                          price: "${product.price}",
                          productId: product.id,
                        );
                      }).toList(),
                    ),
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
    SafeArea(
      child: CustomActionBar(

        hasbackArrow: true,
      title: "Search tab",
      hastitle: true,
      ),
    ),

          Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Custominput(
              ispasswordfield: false,
              hinttext: "search here..",
              onsubmit: (value) {
                if (value.isNotEmpty) { setState(() {
                  _searchString=value;
                });}
              },
            ),
          ),
        ],
      )),
    );
  }
}
