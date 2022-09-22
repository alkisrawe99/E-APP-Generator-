import 'package:flutter/material.dart';

import '../models/Login_user.dart';
import '../models/product.dart';
import '../services/api_product.dart';
import '../services/api_services.dart';
import '../services/category_api.dart';
import '../widgets/productCard.dart';

api_services urls = api_services();

final api_product httpservice = api_product();
final SaveData s=SaveData();
final api_category catservice = api_category();
class grid extends StatefulWidget {
  int _matrex =1;

  int get matrex => _matrex;

  set matrex(int value) {
    _matrex = value;
  }


  @override
  State<grid> createState() => _gridState();
}

class _gridState extends State<grid> {


  @override
  Widget build(BuildContext context) {
    return
      FutureBuilder(
        future:httpservice.getproducts_bycatname(),
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
              return

                GridView.count(
                  crossAxisCount:s.getmatrex(),
                 physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: products.map((product product) {
                    return
                      productCard(
                        title: product.name,
                        imgUrl:
                        (urls.base_url + "image/" + product.image),
                        price: "${product.price}"+"\$",
                        productId: product.id,

                      );



                  }).toList(),
                );
            }
          }

          return  Container();

        },
      );



    /*FutureBuilder(
      future:httpservice.getproducts_bycatname(),
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
            return Padding(
                padding: EdgeInsets.only(top: 2),


                child:Container(
                    height: 10,
                    width: 10,
                    child:
                GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount:2 ,
                  shrinkWrap: true,
                  children: products.map((product product) {
                    return
                      SizedBox.expand(

                     child:    productCard(
                            title: product.name,
                            imgUrl:
                            (urls.base_url + "image/" + product.image),
                            price: "${product.price}",
                            productId: product.id,
                          ),
                    );



                  }).toList(),
                ) ));
          }
        }

        return  Container();

      },
    );
*/




  }
}
