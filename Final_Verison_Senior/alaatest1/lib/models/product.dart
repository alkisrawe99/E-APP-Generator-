
class product {
  product({
    required this.id,
    required this.name_category,
    required this.name,
    required  this.price,
    required  this.dec,
    required  this.image,
    required  this.size,
  });

  late final int id;
  final String name_category;
  final String name;
  final int price;
  final String dec;
  final String image;
  final String size;

  factory product.fromJson(Map<String, dynamic> json){
    return product(
      id: json["id"] as int,
      name_category: json["name_category"] as String,
      name: json["name"] as String,
      price: json["price"] as int,
      dec: json["Description"] as String,
      image: json["image"] as String,
      size: json["size"] as String,
    );
  }



}

class amount {
  amount({
    required this.totals,
    required this.amounts,
  });

  final int totals;
  final int amounts;

  factory amount.fromJson(Map<String, dynamic> json){
    return amount(
      totals: json["total"] as int,
      amounts: json["amount"] as int,

    );
  }



}


