// import 'package:gdsc_appdev/enums/viewstate.dart';
// import 'package:gdsc_appdev/models/clothes_model.dart';
// import 'package:gdsc_appdev/routes/route_constants.dart';
// import 'package:gdsc_appdev/services/clothes_service.dart';
// import 'package:gdsc_appdev/services/locator.dart';
// import 'package:gdsc_appdev/services/navigation_service.dart';
// import 'package:gdsc_appdev/view_models/base_view_model/base_model.dart';
// import 'package:gdsc_appdev/enums/pageNavigatorMethod.dart';

// class ProductScreenViewModel extends BaseModel {
//   //services access
//   final NavigationService _navigationService = locator<NavigationService>();
//   final ClothesService _clothesService = locator<ClothesService>();

// //cart functionlity
//   void addToCartbutton(int productID) {
//     _clothesService.addToCartButton(productID);
//     setState(ViewState.Idle);
//   }

//   bool CheckInCart(int productID) {
//     return _clothesService.CheckInCart(productID);
//   }

//   int get totalCartProducts => _clothesService.totalCartProducts();

//   ClothesProduct getCartProductAtIndex(int index) {
//     return _clothesService.getCartProductAtIndex(index);
//   }

//   void removeFromCart(int index) {
//     _clothesService.removeFromCart(index);
//     setState(ViewState.Idle);
//   }

// //cost
//   int subtotal() {
//     return _clothesService.subtotal();
//   }

// //navigation function
//   void goToProductScreen(int index) {
//     _navigationService.navigatorHandler(
//         method: pageMethod.Push,
//         routeName: RouteConstants.productScreen,
//         arguments: {
//           'index': index,
//         });
//   }
// }
