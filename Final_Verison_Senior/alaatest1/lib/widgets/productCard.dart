import 'package:alaatest1/tabs/home_tab.dart';
import 'package:alaatest1/Choice/user_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../constants.dart';
import '../models/product.dart';
import '../screens/product_page.dart';
import '../services/api_product.dart';

class productCard extends StatelessWidget {
  final int productId;
  final Function? onPressed;
  final String imgUrl;
  final String title;
  final String price;
  productCard(
      {this.onPressed,
      required this.imgUrl,
      required this.title,
      required this.price,
      required this.productId});
  Userchoice s = Userchoice();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductPage(
                      productID: productId,
                    )));
      },
      child:
      Card(margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),

          ),
        child: Container(


      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),

        image: DecorationImage(
              image: NetworkImage( "${imgUrl}",),
              fit: BoxFit.fill,
              alignment: Alignment.center,
            ),
          ),
          child:
          Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Stack(children: [ Text(
              '$title',
              style: TextStyle(
                fontSize: 20,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 6
                  ..color = Colors.red[700]!,
              ),
            ),
              // Solid text as fill.
              Text(
                '$title',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[300],
                ),
              ),],),
            Stack(children: [ Text(
              '$price',
              style: TextStyle(
                fontSize: 20,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 6
                  ..color = Colors.red[700]!,
              ),
            ),
              // Solid text as fill.
              Text(
                '$price',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[300],
                ),
              ),],)
          ],
        ),
        ),
      ),




    );}}

          /*  Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(child:

                    Text(
                      "$title",
                  style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w600),
                ),

              ),
                 Text(
                      "$price\$",
                      style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),*/
/*
            Visibility(
              visible: Userchoice.imgcircle,
              child: Center(
                child:
                Container(
                  height: 250.0,
                  width: 200,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "${imgUrl}",
                    ),
                  ),
                ),
              ),
            ),
*/
          /*  Visibility(
              visible: Userchoice.imgctriangle,

                child: Center(


                  child:

                Container(
                  alignment: Alignment.topCenter,


                  child:Card(
             child:     ClipRRect(
                    child: Image.network(

                      "${imgUrl}",
                      fit: BoxFit.cover,

                    ),

                  ),)
      ),
    );
  }
}*/
/*import 'package:flutter/material.dart';

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
  const grid({Key? key}) : super(key: key);

  @override
  State<grid> createState() => _gridState();
}

class _gridState extends State<grid> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: httpservice.getproducts(),
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


                child:Container(
                    height: 10,
                    width: 10,
                    child:
                GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 2 ,

                  children: products.map((product product) {
                    return
                      Container(
                        child: ClipRRect(
                        child: Image.network(
                        "${urls.base_url + "image/" + product.image}",
                        fit: BoxFit.cover,
                    ),
                    )


                      ); }).toList(),
                ) ));
          }
        }

        return  Container();

      },
    );




    return  Container(
        height: 10,
        width: 10,
        child: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 3 ,
        children: List.generate(50,(index)
    {
      return Container(
        child: Card(
          color: Colors.amber,
        ),
      );
    }
    )
    )
    );
  }
}
*/