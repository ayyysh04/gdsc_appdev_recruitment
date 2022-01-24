//dummy clothes api data

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gdsc_appdev/models/clothes_model.dart';

class ClothesService {
  //all Clothes data
  List<ClothesProduct> _clothesData = [];
  List<ClothesProduct> _likedClothesData = [];
  //functions
  void getLoadClothesData() async {
    await Future.delayed(Duration(seconds: 2)); //Reallife delay
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

  int get totalProducts => _clothesData.length;

//cart functionality
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

  void removeProduct(int index) {
    likebutton(_likedClothesData[index].ProductID);
  }

  int subtotal() {
    return _likedClothesData.fold<int>(
        0,
        (previousValue, product) =>
            (product.isLiked ? product.Price : 0) + previousValue);
  }
}
