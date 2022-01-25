import 'dart:convert';

class ClothesProduct {
  final int productID;
  final String name;
  final String productURL;
  final int price;
  bool isLiked = false;
  ClothesProduct({
    required this.productID,
    required this.name,
    required this.productURL,
    required this.price,
  });

  ClothesProduct copyWith({
    int? productID,
    String? name,
    String? productURL,
    int? price,
  }) {
    return ClothesProduct(
      productID: productID ?? this.productID,
      name: name ?? this.name,
      productURL: productURL ?? this.productURL,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ProductID': productID,
      'Name': name,
      'ProductURL': productURL,
      'Price': price,
    };
  }

  factory ClothesProduct.fromMap(Map<String, dynamic> map) {
    return ClothesProduct(
      productID: map['ProductID']?.toInt() ?? 0,
      name: map['Name'] ?? '',
      productURL: map['ProductURL'] ?? '',
      price: map['Price']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClothesProduct.fromJson(String source) =>
      ClothesProduct.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(ProductID: $productID, Name: $name, ProductURL: $productURL, Price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ClothesProduct &&
        other.productID == productID &&
        other.name == name &&
        other.productURL == productURL &&
        other.price == price;
  }

  @override
  int get hashCode {
    return productID.hashCode ^
        name.hashCode ^
        productURL.hashCode ^
        price.hashCode;
  }
}
