//dummy clothes api data

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gdsc_appdev/models/clothes_model.dart';
import 'package:gdsc_appdev/services/hive.dart';
import 'package:gdsc_appdev/services/locator.dart';

class ClothesService {
  //hive service
  HiveUtil _hiveUtil = locator.get();
  //all Clothes data
  List<ClothesProduct> _clothesData = [];
  List<int> _likedClothesData = [];
  List<int> _cartClothesData = [];
  //functions
  Future<void> getLoadClothesData() async {
    await Future.delayed(Duration(seconds: 5)); //Reallife delay
    final dummyJson = await rootBundle.loadString("assets/json/dummyData.json");
    final decodedData = jsonDecode(dummyJson);
    var productsData = decodedData["products"];
    _clothesData = List.from(productsData)
        .map<ClothesProduct>((clothes) => ClothesProduct.fromMap(clothes))
        .toList();

    _likedClothesData = _hiveUtil.getLikePrductList();
    _cartClothesData = _hiveUtil.getCartPrductList();
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

  bool isLikedAtProductId(int productID) {
    return _likedClothesData.contains(productID);
  }

  void likebuttonAtProductID(int productID) {
    // int productIndex =
    //     _clothesData.indexWhere((element) => element.productID == productID);

    // _clothesData[productIndex].isLiked = !_clothesData[productIndex].isLiked;
    int productIndex =
        _clothesData.indexWhere((element) => element.productID == productID);
    if (isLikedAtProductId(productID) == true) {
      _likedClothesData
          .removeWhere((listproductID) => listproductID == productID);

      _hiveUtil.likeProductHandle(productID: productID, index: productIndex);
    } else {
      _likedClothesData.add(productID);
      _hiveUtil.likeProductHandle(productID: productID, index: productIndex);
    }
  }

  ClothesProduct getLikedProductAtIndex(int index) {
    return _clothesData
        .firstWhere((element) => element.productID == _likedClothesData[index]);
  }

  //cart product functionality
  int totalCartProducts() {
    return _cartClothesData.length;
  }

  void addToCartButtonAtProductID(int productID) {
    int productIndex =
        _clothesData.indexWhere((element) => element.productID == productID);
    if (checkInCart(productID)) {
      _cartClothesData.removeWhere((element) => element == productID);
      _hiveUtil.cartProductHandle(productID: productID, index: productIndex);
    } else {
      _cartClothesData.add(productID);
      _hiveUtil.cartProductHandle(productID: productID, index: productIndex);
    }
  }

  bool checkInCart(int productID) {
    return _cartClothesData.contains(productID);
  }

  ClothesProduct getCartProductAtIndex(int index) {
    return _clothesData
        .firstWhere((element) => element.productID == _cartClothesData[index]);
  }

  void removeFromCartAtIndex(int index) {
    addToCartButtonAtProductID(_clothesData
        .firstWhere((element) => element.productID == _cartClothesData[index])
        .productID);
  }

//cost
  int subtotal() {
    return _cartClothesData.fold<int>(0, (previousValue, productId) {
      return _clothesData
              .firstWhere((element) => element.productID == productId)
              .price +
          previousValue;
    });
  }
}
