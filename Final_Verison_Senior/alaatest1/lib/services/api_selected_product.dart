import 'dart:convert';

import 'package:alaatest1/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:alaatest1/models/product.dart';
import 'api_services.dart';

class api_selected_product {
  late int id_selected;

  Future <List<product>> getproducts_id(id_selected) async {
    api_services urls= api_services();
    final String URL= urls.base_url + "api/get_item/"+"$id_selected";
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
      throw Exception('Failed to load album');
    }
  }




}