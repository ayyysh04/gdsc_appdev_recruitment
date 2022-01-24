import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:gdsc_appdev/enums/viewstate.dart';
import 'package:gdsc_appdev/models/clothes_model.dart';
import 'package:gdsc_appdev/services/clothes_service.dart';
import 'package:gdsc_appdev/services/locator.dart';
import 'package:gdsc_appdev/services/navigation_service.dart';
import 'package:gdsc_appdev/view_models/base_view_model/index_tracking_model.dart';
import 'package:get_it/get_it.dart';

class HomeScreenViewModel extends IndexTrackingModel implements Disposable {
  //services access
  // final SharedPrefs _sharedPrefs = locator.get();
  final NavigationService _navigationService = locator<NavigationService>();
  final ClothesService _clothesService = locator<ClothesService>();

//constrcutor
  HomeScreenViewModel() {
    getClothesData();
  }

//Clothes service
  void getClothesData() {
    setState(ViewState.Busy);
    _clothesService.getLoadClothesData();
    setState(ViewState.Idle);
  }

  ClothesProduct productAtIndex(int index) =>
      _clothesService.getProductAtIndex(index);

  int get totalProducts => _clothesService.totalProducts;
//like functionlity
  void likebutton(int productID) {
    _clothesService.likebutton(productID);
    setState(ViewState.Idle);
  }

  int get totalLikedProducts => _clothesService.totalLikedProducts();

  ClothesProduct getLikedProductAtIndex(int index) {
    return _clothesService.getLikedProductAtIndex(index);
  }

  void removeProduct(int index) {
    _clothesService.removeProduct(index);
    setState(ViewState.Idle);
  }

  int subtotal() {
    return _clothesService.subtotal();
  }
//navigation functions

  PageController pageController = PageController(initialPage: 0);

  void onPageChanged(int index) {
    setIndex(index);
  }

  toPageIndex(int index) {
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  @override
  FutureOr onDispose() {
    super.dispose();
  }
}
