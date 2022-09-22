
class Sales {
  Sales({
    required this.id,
    required this.name,
    required  this.price_old,
    required  this.price_new,
    required  this.image,

  });

  late final int id;
  final String name;
  final int price_old;
  final int price_new;
  final String image;


  factory Sales.fromJson(Map<String, dynamic> json){
    return Sales(
      id: json["id"] as int,
      name: json["name"] as String,
      price_old: json["price_old"] as int,
      price_new: json["price_new"] as int,
      image: json["image"] as String,
    );
  }



}







