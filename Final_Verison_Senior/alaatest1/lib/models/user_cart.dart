class user_cart{
 final int cart_ID;
 final int product_id;
 user_cart({
   required this.cart_ID,
   required this.product_id,





 });
 factory user_cart.fromJson(Map<String, dynamic> json){
  return user_cart(
      cart_ID: json["id_user"] as int,
      product_id: json["id_item"] as int,);
 }

}