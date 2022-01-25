//dummy clothes api data

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gdsc_appdev/models/clothes_model.dart';

class ClothesService {
  //all Clothes data
  List<ClothesProduct> _clothesData = [];
  List<ClothesProduct> _likedClothesData = [];
  List<ClothesProduct> _CartClothesData = [];
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
        _clothesData.indexWhere((element) => element.ProductID == productID);
    return productIndex;
  }

  int get totalProducts => _clothesData.length;

//like product functionality
  int totalLikedProducts() {
    return _likedClothesData.length;
  }

  void likebutton(int productID) {
    int productIndex =
        _clothesData.indexWhere((element) => element.ProductID == productID);
    _clothesData[productIndex].isLiked = !_clothesData[productIndex].isLiked;
    if (_clothesData[productIndex].isLiked == false)
      _likedClothesData
          .removeWhere((element) => element.ProductID == productID);
    else
      _likedClothesData.add(_clothesData[productIndex]);
  }

  ClothesProduct getLikedProductAtIndex(int index) {
    return _likedClothesData[index];
  }

  void removeLikedProduct(int index) {
    likebutton(_likedClothesData[index].ProductID);
  }

  //cart product functionality
  int totalCartProducts() {
    return _CartClothesData.length;
  }

  void addToCartButton(int productID) {
    int productIndex =
        _clothesData.indexWhere((element) => element.ProductID == productID);
    if (_CartClothesData.contains(_clothesData[productIndex]))
      _CartClothesData.removeWhere((element) => element.ProductID == productID);
    else
      _CartClothesData.add(_clothesData[productIndex]);
  }

  bool CheckInCart(int productID) {
    int productIndex =
        _clothesData.indexWhere((element) => element.ProductID == productID);
    return _CartClothesData.contains(_clothesData[productIndex]);
  }

  ClothesProduct getCartProductAtIndex(int index) {
    return _CartClothesData[index];
  }

  void removeFromCart(int index) {
    addToCartButton(_CartClothesData[index].ProductID);
  }

//cost
  int subtotal() {
    return _CartClothesData.fold<int>(
        0,
        (previousValue, product) =>
            (product.isLiked ? product.Price : 0) + previousValue);
  }
}
