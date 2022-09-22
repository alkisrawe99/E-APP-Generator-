import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../services/api_product.dart';
import '../services/api_services.dart';
import '../widgets/productCard.dart';

final api_product httpservice = api_product();
api_services urls = api_services();


class Product_Category extends StatefulWidget {
  const Product_Category({Key? key}) : super(key: key);

  @override
  State<Product_Category> createState() => _Product_CategoryState();
}

class _Product_CategoryState extends State<Product_Category> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return FutureBuilder(
      future: httpservice.getproducts_bycatname(),
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
                padding: EdgeInsets.only(top: 20),
                child:
                Column(


                  children: products.map((product product) {
                    return

                      productCard(

                        title: product.name,
                        imgUrl:
                        (urls.base_url + "image/" + product.image),
                        price: "${product.price}",
                        productId: product.id,
                      );
                  }).toList(),

                ));
          }
        }

        return  Container();

      },
    );

  }
}
