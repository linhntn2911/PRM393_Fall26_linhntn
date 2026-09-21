class Product {
  final String id;
  final String name;
  final int quantity;
  final double price;
  final String description;
  final String imageUrl;

  Product({required this.id, required this.name, this.quantity=0,
    this.price=0, this.description='', this.imageUrl=''});

  Product copyProduct({
    String? id,
    String? name,
    int? quantity,
    double? price,
    String? description,
    String? imageUrl,
  })
  {
    return new Product(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,

    );
  }
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,);
  }

}

