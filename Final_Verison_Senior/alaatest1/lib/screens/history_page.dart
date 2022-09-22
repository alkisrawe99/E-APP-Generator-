import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Choice/History_Choice.dart';
import '../Tabs/saved_tab.dart';
import '../Tabs/search_tab.dart';
import '../models/product.dart';
import '../services/api_product.dart';
import '../services/api_services.dart';
import '../widgets/custom_action_bar.dart';
import '../widgets/custom_button.dart';

final api_history httpservice = api_history();
api_services a = api_services();

class history_page extends StatelessWidget {
  const history_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: httpservice.get_history(),
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
                  return ListView(
                    padding: EdgeInsets.only(top: 100.0, bottom: 12.0),
                    children: products.map((product product) {
                      return GestureDetector(
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 24),
                              child: Card(
                                color: History_Choice.card,
                                shadowColor: Colors.blue,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 125,
                                      height: 180,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                                fontSize: History_Choice.font_size,
                                                color: History_Choice
                                                    .font_color,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4.0),
                                              child: Row(children: [
                                                Text(
                                                  "${product.price}",
                                                  style: TextStyle(
                                                      fontSize: History_Choice.font_size,
                                                      color: History_Choice
                                                          .font_color,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Icon(
                                                    size: History_Choice
                                                        .icon_size,
                                                    Icons.money_off,
                                                    color: History_Choice
                                                        .icon_color),
                                              ])),
                                          Text(
                                            "Category: ${product.name_category}",
                                            style: TextStyle(
                                                fontSize: History_Choice.font_size,
                                                color: History_Choice.font_color,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )));
                    }).toList(),
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
          Padding(
            padding: EdgeInsets.only(top: 700),
            child: Custombtn(
              onpressed: () {
                httpservice.delete_all_history();
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => history_page()));
              },
              text: ("Clean History"),
              c:History_Choice.Button,

            ),
          ),
          SafeArea(
            child: CustomActionBar(
              hasbackArrow: true,
              title: "History",
            ),
          ),
        ],
      ),
    );
  }
}
