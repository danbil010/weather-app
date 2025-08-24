class ProductModel {
  final String title;
  final String subtitle;
  final String date;
  final double price;
  final String fnb;   
  final String image; 

  ProductModel({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.price,
    required this.fnb,
    required this.image,
  });

  // From JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      date: json['date'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      fnb: json['fnb'] ?? '',
      image: json['image'] ?? 'assets/images/placeholder.png', 
    );
  }

 
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'date': date,
      'price': price,
      'fnb': fnb,
      'image': image,
    };
  }
}
