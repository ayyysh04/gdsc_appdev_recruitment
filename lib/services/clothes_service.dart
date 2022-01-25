//dummy clothes api data

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gdsc_appdev/models/clothes_model.dart';

class ClothesService {
  //all Clothes data
  List<ClothesProduct> _clothesData = [];
  List<ClothesProduct> _likedClothesData = [];
  List<ClothesProduct> _cartClothesData = [];
  //functions
  Future<void> getLoadClothesData() async {
    await Future.delayed(Duration(seconds: 5)); //Reallife delay
    final dummyJson = await rootBundle.loadString("assets/json/dummyData.json");
    final decodedData = jsonDecode(dummyJson);
    var productsData = decodedData["products"];
    _clothesData = List.from(productsData)
        .map<ClothesProduct>((clothes) => ClothesProduct.fromMap(clothes))
        .toList();
  }

  ClothesProduct getProductAtIndex(int index) {
    return _clothesData[index];
  }

  int productIndexAtProductID(int productID) {
    int productIndex =
        _clothesData.indexWhere((element) => element.productID == productID);
    return productIndex;
  }

  int get totalProducts => _clothesData.length;

//like product functionality
  int totalLikedProducts() {
    return _likedClothesData.length;
  }

  void likebutton(int productID) {
    int productIndex =
        _clothesData.indexWhere((element) => element.productID == productID);
    _clothesData[productIndex].isLiked = !_clothesData[productIndex].isLiked;
    if (_clothesData[productIndex].isLiked == false) {
      _likedClothesData
          .removeWhere((element) => element.productID == productID);
    } else {
      _likedClothesData.add(_clothesData[productIndex]);
    }
  }

  ClothesProduct getLikedProductAtIndex(int index) {
    return _likedClothesData[index];
  }

  void removeLikedProduct(int index) {
    likebutton(_likedClothesData[index].productID);
  }

  //cart product functionality
  int totalCartProducts() {
    return _cartClothesData.length;
  }

  void addToCartButton(int productID) {
    int productIndex =
        _clothesData.indexWhere((element) => element.productID == productID);
    if (_cartClothesData.contains(_clothesData[productIndex])) {
      _cartClothesData.removeWhere((element) => element.productID == productID);
    } else {
      _cartClothesData.add(_clothesData[productIndex]);
    }
  }

  bool checkInCart(int productID) {
    int productIndex =
        _clothesData.indexWhere((element) => element.productID == productID);
    return _cartClothesData.contains(_clothesData[productIndex]);
  }

  ClothesProduct getCartProductAtIndex(int index) {
    return _cartClothesData[index];
  }

  void removeFromCart(int index) {
    addToCartButton(_cartClothesData[index].productID);
  }

//cost
  int subtotal() {
    return _cartClothesData.fold<int>(
        0,
        (previousValue, product) =>
            (product.isLiked ? product.price : 0) + previousValue);
  }
}
