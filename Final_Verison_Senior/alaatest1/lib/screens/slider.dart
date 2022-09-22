import 'package:alaatest1/services/api_services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/sales.dart';
api_services http =api_services();
int activeIndex = 0;
final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
class Slideraa extends StatefulWidget {
  const Slideraa({Key? key}) : super(key: key);

  @override
  State<Slideraa> createState() => _SliderState();
}

class _SliderState extends State<Slideraa> {
  @override
  Widget build(BuildContext context) {






    return FutureBuilder(
      future: http.getSales(),
      builder: (context, AsyncSnapshot<List<Sales>> snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("error ${snapshot.error}"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          List<Sales>? Saless = snapshot.data;

          if (Saless != null) {
            return Padding(
                padding: EdgeInsets.only(top: 20),
                child:
                Column(




children:[
                    CarouselSlider(
                      options: CarouselOptions(height: 150.0,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        autoPlayInterval: Duration(seconds: 5),
                      ),
                      items: Saless.map((Sales Sales) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    color: Colors.black12
                                ),
                                child: buildImage(http.base_url + "image/" +Sales.image,Sales.name,Sales.price_old.toString(),Sales.price_new.toString()),
                            );
                          },
                        );


                      }).toList(),
                    )
]
                  /*  children: Saless.map((Sales Sales) {
                    return

                      CarouselSlider.builder(
                          options: CarouselOptions(
                            height: 200,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            autoPlayInterval: Duration(seconds: 5),


                          ),

                          itemCount:Saless.length,
                          itemBuilder: (context, index, realindex) {

                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 12),
                              color: Colors.white38,
                              child: buildImage(http.base_url + "image/" +Sales.image),
                            );
                          }





                      );
                  }).toList()*/
                ));
          }
        }

        return  Container();

      },
    );



  }
  Widget buildImage(String urlImage,String a,String b,String c) => Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      color: Colors.grey,
  child:    Stack(




    children:[
    Container(
           child: Image.network(
              urlImage,
              fit: BoxFit.cover,
             width: double.infinity,

           ),
    ),
      Container(
          alignment: Alignment.topLeft,
          child: Text(
            a,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22.0),
          )),
      Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            b,
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 22.0),
          )),
      Container(
          alignment: Alignment.bottomRight,
          child: Text(
            c,
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 22.0,fontStyle:FontStyle.italic ),
          )),
]



  )


  );
}
