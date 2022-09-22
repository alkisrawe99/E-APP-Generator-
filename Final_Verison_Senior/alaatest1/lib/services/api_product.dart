import 'dart:convert';

import 'package:alaatest1/models/get_item_id.dart';
import 'package:alaatest1/models/user.dart';
import 'package:alaatest1/models/user_cart.dart';
import 'package:alaatest1/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:alaatest1/models/product.dart';

import '../models/Login_user.dart';
import '../screens/login_page.dart';
int get_id(){
  SaveData x=SaveData();
  int y=x.getId();
  return y;
}


int get_itemmmmmmmmmmmm(){
  get_item_id s2=get_item_id();

  int productID=s2.getid_item();
  return productID;
}
api_services a=api_services();
class api_product {


 /* Future <List<product>> getproducts() async {
     String URL=a.base_url+"api/view_items";
    final response = await http.get(Uri.parse(URL));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<dynamic> body=jsonDecode(response.body);
      List<product> products=body.map((dynamic item)=>product.fromJson(item)).toList();
      return products;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load products');
    }
  }*/


  Future <List<product>> getproducts_bycatname() async {
    api_services urls= api_services();
    SaveData s=SaveData();
    String name;
    name="salad";
    name =s.getname();


       String URL;
      URL= urls.base_url + "api/item_category/"+name;
      if(name=="all"){       URL= urls.base_url + "api/view_items";

      }
    final response = await http.get(Uri.parse(URL));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<dynamic> body=jsonDecode(response.body);
      List<product> products=body.map((dynamic item)=>product.fromJson(item)).toList();
      return products;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('hhhhhhhhhhhhhhhhhhhhhh');
    }
  }







}
class api_products_cart {
Future <List<product>> getproducts_cart() async {

  final String URL_cart=a.base_url+"api/view_cart/"+get_id().toString();
  final response = await http.get(Uri.parse(URL_cart));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<dynamic> body=jsonDecode(response.body);
    List<product> products=body.map((dynamic item)=>product.fromJson(item)).toList();
    return products;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Cart is empty');
  }
}



}

class Buy{
  Future<dynamic> Buy_items()async{



    var response = await http.post(
        Uri.parse(a.base_url+"api/buy/"), body: ({
      'id_user': get_id().toString(),
    }));


    if (response.statusCode == 200) {

      throw("Buy_items successfully");



    }
    else if(response.statusCode == 404){
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw ('salary not tokfi');
    }
    else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw ('Buy_items item');
    }



  }
}
class remove{

  Future<dynamic> delete_save()async{



    var response = await http.post(
        Uri.parse(a.base_url+"api/delete_save/"), body: ({
      'id_user': get_id().toString(),
      'id_item': get_itemmmmmmmmmmmm().toString()
    }));


    if (response.statusCode == 200) {

      throw("delete item_saved successfully");



    }
    else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw ('no saved items');
    }



  }



  Future<dynamic> delete_item_from_cart()async{



    var response = await http.post(
        Uri.parse(a.base_url+"api/delete_cart/"), body: ({
      'id_user': get_id().toString(),
      'id_item': get_itemmmmmmmmmmmm().toString()
    }));


    if (response.statusCode == 200) {

      throw("delete item successfully");



    }
    else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw ('Failed delete item');
    }



  }


  Future<dynamic> delete_all_item_from_cart()async{



    var response = await http.post(
        Uri.parse(a.base_url+"api/delete_all_cart/"), body: ({
      'id_user': get_id().toString(),
          }));


    if (response.statusCode == 200) {

      throw("delete item successfully");



    }
    else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw ('Failed delete item');
    }



  }

}

class api_products_save {
  Future <List<product>> getproducts_save() async {

    final String URL_cart=a.base_url+"api/view_save/"+get_id().toString();
    final response = await http.get(Uri.parse(URL_cart));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<dynamic> body=jsonDecode(response.body);
      List<product> products=body.map((dynamic item)=>product.fromJson(item)).toList();
      return products;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw "No saved products";
    }
  }}



class api_history {
  Future<dynamic> delete_all_history()async{



    var response = await http.post(
        Uri.parse(a.base_url+"api/delete_all_history/"), body: ({
      'id_user': get_id().toString(),
    }));


    if (response.statusCode == 200) {

      throw("delete item successfully");



    }
    else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw ('Failed delete item');
    }



  }



  Future <List<product>> get_history() async {

    var response = await http.post(
        Uri.parse(a.base_url+"api/history/"), body: ({
      'id_user': get_id().toString(),
    }));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<dynamic> body=jsonDecode(response.body);
      List<product> products=body.map((dynamic item)=>product.fromJson(item)).toList();
      return products;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw "history is empty";
    }
  }}



  class getusercridets{
    Future<List<amount>> getcridets()async{
      var response = await http.post(
          Uri.parse(a.base_url+"api/amount/"), body: ({
        'id_user': get_id().toString(),
      }));
      var data1= jsonDecode(response.body);
      if (response.statusCode == 200) {

        List<dynamic> body=jsonDecode(response.body);
        List<amount> amounts=body.map((dynamic item)=>amount.fromJson(item)).toList();
        return amounts;



      }
      else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw ('Failed ');
      }

    }


  }