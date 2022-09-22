import 'dart:convert';
import 'dart:io';


import 'package:alaatest1/services/api_product.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/product.dart';
import"package:http/http.dart" as http;

import '../models/sales.dart';
import '../models/user.dart';
class api_services{
  late String base_url="http://192.168.43.52:8000/";
  late String cat_URL= base_url+"api/view_category";
  late String prod_url=base_url+"api/view_items";
  late String User_url=base_url+"api/showalluser";
  late String Sales_url=base_url+"api/get_sale";
  Future <List<product>> getproducts_id(id_selected) async {

    final String URL=base_url+"api/get_item/"+"$id_selected";
    final response = await http.get(Uri.parse(URL));
//spinkit
    if (response.statusCode == 200) {

      List<dynamic> body=jsonDecode(response.body);
      List<product> products=body.map((dynamic item)=>product.fromJson(item)).toList();
      return products;
    } else {

      throw Exception('Failed to load album');
    }
  }
  Future <List<product>> getproducts() async {

    final response = await http.get(Uri.parse(prod_url));

    if (response.statusCode == 200) {

      List<dynamic> body=jsonDecode(response.body);
      List<product> products=body.map((dynamic item)=>product.fromJson(item)).toList();
      return products;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
  Future <List<category>> getcategory() async {

    final response = await http.get(Uri.parse(cat_URL));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<dynamic> body=jsonDecode(response.body);
      List<category> categories=body.map((dynamic item)=>category.fromJson(item)).toList();
      return categories;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load items');
    }
  }
  Future <List<user>> getusers() async {


    var response = await http.post(
        Uri.parse(base_url+"api/get_user/"), body: ({
      'id_user': "9"
    }));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<dynamic> body=jsonDecode(response.body);
      List<user> users=body.map((dynamic item)=>user.fromJson(item)).toList();
      return users;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
  Future <dynamic> getuserID() async {

    final response = await http.get(Uri.parse(User_url));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<dynamic> body=jsonDecode(response.body);
      List<user> users=body.map((dynamic item)=>user.fromJson(item)).toList();
      return users;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<List<product>> getsearchresult(String s)async{
    var response = await http.post(
        Uri.parse(base_url+"api/search_item/"), body: ({
      'data': s,

    }));

    var data1= jsonDecode(response.body);
    if (response.statusCode == 200) {

      List<dynamic> body=jsonDecode(response.body);
      List<product> products=body.map((dynamic item)=>product.fromJson(item)).toList();
      return products;



    }
    else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to find product');
    }



  }
  Future<dynamic> Add_to_cart(String U_id,String P_ID)async{
    var response = await http.post(
        Uri.parse(base_url+"api/add_cart/"), body: ({
      'id_user': U_id,
      'id_item': P_ID
    }));

    var data1= jsonDecode(response.body);
    if (response.statusCode == 200) {

     throw("added to cart successfully");



    }
    else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw ('Failed added to cart');
    }



  }

  Future<dynamic> Add_to_save(String U_id,String P_ID)async{
    var response = await http.post(
        Uri.parse(base_url+"api/add_save/"), body: ({
      'id_user': U_id,
      'id_item': P_ID
    }));

    var data1= jsonDecode(response.body);
    if (response.statusCode == 200) {

      throw("added to save successfully");



    }
    else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw ('Failed added to save');
    }



  }


  Future <List<Sales>> getSales() async {

    final response = await http.get(Uri.parse(Sales_url));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<dynamic> body=jsonDecode(response.body);
      List<Sales> Sa=body.map((dynamic item)=>Sales.fromJson(item)).toList();
      return Sa;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to Sales');
    }
  }




}