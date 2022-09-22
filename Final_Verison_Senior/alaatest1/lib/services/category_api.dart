import 'dart:convert';

import 'package:alaatest1/models/category.dart';
import 'package:alaatest1/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:alaatest1/models/product.dart';

import 'api_services.dart';


class api_category {
  api_services a=api_services();
  late String base_url=a.base_url+"api/";
  late String URL= base_url+"view_category";
  Future <List<category>> getcategory() async {

    final response = await http.get(Uri.parse(URL));

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


}