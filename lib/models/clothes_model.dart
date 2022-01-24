import 'dart:convert';

import 'package:flutter/foundation.dart';

class ClothesProduct {
  final int ProductID;
  final String Name;
  final String ProductURL;
  final int Price;
  bool isLiked = false;
  ClothesProduct({
    required this.ProductID,
    required this.Name,
    required this.ProductURL,
    required this.Price,
  });

  ClothesProduct copyWith({
    int? ProductID,
    String? Name,
    String? ProductURL,
    int? Price,
  }) {
    return ClothesProduct(
      ProductID: ProductID ?? this.ProductID,
      Name: Name ?? this.Name,
      ProductURL: ProductURL ?? this.ProductURL,
      Price: Price ?? this.Price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ProductID': ProductID,
      'Name': Name,
      'ProductURL': ProductURL,
      'Price': Price,
    };
  }

  factory ClothesProduct.fromMap(Map<String, dynamic> map) {
    return ClothesProduct(
      ProductID: map['ProductID']?.toInt() ?? 0,
      Name: map['Name'] ?? '',
      ProductURL: map['ProductURL'] ?? '',
      Price: map['Price']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClothesProduct.fromJson(String source) =>
      ClothesProduct.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(ProductID: $ProductID, Name: $Name, ProductURL: $ProductURL, Price: $Price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ClothesProduct &&
        other.ProductID == ProductID &&
        other.Name == Name &&
        other.ProductURL == ProductURL &&
        other.Price == Price;
  }

  @override
  int get hashCode {
    return ProductID.hashCode ^
        Name.hashCode ^
        ProductURL.hashCode ^
        Price.hashCode;
  }
}
