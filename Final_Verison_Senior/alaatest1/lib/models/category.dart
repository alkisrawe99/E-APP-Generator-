class category {
  category({required this.id, required this.name,required this.img});
  final int id;
  final String name;
  final String img;
  factory category.fromJson(Map<String, dynamic> json) {
    return category(
      id: json["id"] as int,
      name: json["name"] as String,
      img: json["image"] as String,
    );
  }
}
