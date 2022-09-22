
import 'package:alaatest1/Choice/Cart_Choice.dart';
import 'package:alaatest1/screens/product_page.dart';
import 'package:alaatest1/widgets/custom_action_bar.dart';
import 'package:alaatest1/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

import '../models/Login_user.dart';
import '../models/get_item_id.dart';
import '../models/product.dart';
import '../services/api_product.dart';
import '../Choice/user_choice.dart';
import '../widgets/Sidebar.dart';
import '../widgets/custom_action_bar.dart';
import '../widgets/custom_button.dart';
final api_products_cart httpservice = api_products_cart();
final remove httpservice2 = remove();
final Buy buy=Buy();
get_item_id s2 =get_item_id();
getusercridets uc=getusercridets();

int i=0;
final SnackBar _snackbar = SnackBar(
  content: Text("buy ok"),
);
class cartPage extends StatefulWidget {






  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  buy_item_cart()  {


    buy.Buy_items();
  }

  delete_item_cart()  {


    httpservice2.delete_item_from_cart();
  }
  delete_all_item_cart()  {
    httpservice2.delete_all_item_from_cart();
  }
  @override
  Widget build(BuildContext context) {
    var userRef;
    return Scaffold(backgroundColor: Cart_Choice.background_color,
        bottomNavigationBar: Material(

          child: Row(
            children: [
              Expanded(
                  child: Custombtn(c:Cart_Choice.Button,onpressed: () {

        delete_all_item_cart();
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>cartPage()));
        },text: "Clean Cart",)),
              Expanded(
                child: Custombtn(c :Cart_Choice.Button,
                  onpressed: (){   buy_item_cart();
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>cartPage()));
    },text: "Buy products",
                ),
              ),
    ]
          )
        ),
        body: Stack(
            children: [
              FutureBuilder(
                future: httpservice.getproducts_cart(),
                builder: (context, AsyncSnapshot<List<product>>  snapshot) {
                  if (snapshot.hasError) {
                    return Scaffold(
                      body: Center(
                        child: Text("error ${snapshot.error}"),
                      ),
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.done)
                  {                List<product>? products = snapshot.data;

                  if (products != null) {
                    return ListView(
                      padding: EdgeInsets.only(top: 100.0, bottom: 12.0),
                      children: products.map((product product) {
                        return










                          GestureDetector(

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

Row(children: [

  Text(
    "${product.name}",
    style: TextStyle(
        fontSize: Cart_Choice.font_size,
        color: Colors.black,
        fontWeight: FontWeight.w600),
  ),

  IconButton(
    onPressed: () {
      {
         s2.setid_item(product.id);
         delete_item_cart();
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>cartPage()));

      };
    },
    alignment: Alignment.topRight,
    icon: Icon(
      Icons.remove_circle,
      color: Colors.red,
      size: Cart_Choice.icon_size,
    )),

],),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0),
                                          child: Text(
                                            "${product.price}",
                                            style: TextStyle(
                                                fontSize: Cart_Choice.font_size,

                                                color:Cart_Choice.font_color,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),

                                        Text(
                                          "Size: ${product.size}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            IconButton(
                                                onPressed: () {

                                                setState(() {
                                                 i= i-1;
                                                });


                                                },
                                                icon: Icon(
                                                  Icons.remove_circle_outline,
                                                  color: Colors.black,
                                                )),
                                            Container(
                                                width: 44.0,
                                                height: 44.0,
                                                padding: EdgeInsets.only(top: 22.0),
                                                color: Colors.blue,
                                                child: TextField(
                                                  enabled: false,
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: i.toString(),
                                                      hintStyle:
                                                      TextStyle(color: Colors.white38)),
                                                )),




                                            IconButton(
                                                onPressed: () {
                                                   {

                                                    setState(() { i= i+1;
                                                    });
                                                  };
                                                },
                                                icon: Icon(
                                                  Icons.add_circle_outline,
                                                  color: Colors.black,
                                                )),
                                          ],
                                        ),


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
              SafeArea(child:
              CustomActionBar(

                hasbackArrow: true,
                title: "Cart",
              ),
              ),




              FutureBuilder(
                  future: uc.getcridets(),
                  builder: (context, AsyncSnapshot<List<amount>> snapshot) {
                    if (snapshot.hasError) {
                      return Scaffold(
                        body: Center(
                          child: Text("error ${snapshot.error}"),
                        ),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.done) {
                      List<amount>? amounts = snapshot.data;


                      if (amounts != null) {
                        return
                          Padding(padding: EdgeInsets.only(top: 500), child: ListView(
                            children: amounts.map((amount amount) {
                              return Row(children:[Icon(Icons.credit_card),Text(amount.amounts.toString()),
                                Icon(Icons.receipt_long),Text((amount.totals*i).toString())
                              ]
                              );

                            }


                            ).toList(),
                          )
                          );
                      }
                    }

                    return Scaffold(
                      body: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }


              ),

            ]
        )
    );
  }

}

