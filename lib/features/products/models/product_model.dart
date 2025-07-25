class ProductModel {
  final int id;
  final String name;
  final String image;
  final double price;
  final String description; 
  final double rate;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.rate,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      rate: json['rating'],
      id: json['id'],
      name: json['title'],
      image: json["thumbnail"],
      price: (json['price'] as num).toDouble(),
      description: json['description'] ?? '',
    );
  }
}
