import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:gdsc_appdev/enums/viewstate.dart';
import 'package:gdsc_appdev/models/clothes_model.dart';
import 'package:gdsc_appdev/routes/route_constants.dart';
import 'package:gdsc_appdev/services/clothes_service.dart';
import 'package:gdsc_appdev/services/locator.dart';
import 'package:gdsc_appdev/services/navigation_service.dart';
import 'package:gdsc_appdev/view_models/base_view_model/index_tracking_model.dart';
import 'package:get_it/get_it.dart';
import 'package:gdsc_appdev/enums/page_navigator_method.dart';

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
  Future<void> getClothesData() async {
    setState(ViewState.busy);
    await _clothesService.getLoadClothesData();

    setState(ViewState.idle);
  }

  ClothesProduct productAtIndex(int index) =>
      _clothesService.getProductAtIndex(index);

  int productIndexAtProductID(int productID) =>
      _clothesService.productIndexAtProductID(productID);

  int get totalProducts => _clothesService.totalProducts;
//like functionlity
  void likebuttonAtProductID(int productID) {
    _clothesService.likebuttonAtProductID(productID);
    setState(ViewState.idle);
  }

  int get totalLikedProducts => _clothesService.totalLikedProducts();

  ClothesProduct getLikedProductAtIndex(int index) {
    return _clothesService.getLikedProductAtIndex(index);
  }

  bool isLikedAtProductId(int productID) {
    return _clothesService.isLikedAtProductId(productID);
  }

//cart functionlity
  void addToCartButtonAtProductID(int productID) {
    _clothesService.addToCartButtonAtProductID(productID);
    setState(ViewState.idle);
  }

  bool checkInCart(int productID) {
    return _clothesService.checkInCart(productID);
  }

  int get totalCartProducts => _clothesService.totalCartProducts();

  ClothesProduct getCartProductAtIndex(int index) {
    return _clothesService.getCartProductAtIndex(index);
  }

  void removeFromCartAtIndex(int index) {
    _clothesService.removeFromCartAtIndex(index);
    setState(ViewState.idle);
  }

//cost
  int subtotal() {
    return _clothesService.subtotal();
  }
//pageview functions

  PageController pageController = PageController(initialPage: 0);

  void onPageChanged(int index) {
    setIndex(index);
  }

  toPageIndex(int index) {
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

//navigation function
  void goToProductScreen(int index) {
    _navigationService.navigatorHandler(
        method: pageMethod.push,
        routeName: RouteConstants.productScreen,
        arguments: {
          'index': index,
        });
  }

  @override
  FutureOr onDispose() {
    super.dispose();
  }
}
