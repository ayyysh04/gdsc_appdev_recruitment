import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_appdev/components/appbar.dart';
import 'package:gdsc_appdev/components/scroll_behaviour.dart';
import 'package:gdsc_appdev/constants/constants.dart';
import 'package:gdsc_appdev/services/locator.dart';
import 'package:gdsc_appdev/view_models/home_screen_view_model.dart';
import 'package:gdsc_appdev/views/base_view/base_view.dart';
import 'package:gdsc_appdev/views/homepage/pages/cart_page.dart';
import 'package:gdsc_appdev/views/homepage/pages/fav_page.dart';
import 'package:gdsc_appdev/views/homepage/pages/shop_page.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenViewModel _homeScreenViewModel =
      locator.get<HomeScreenViewModel>();
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: PageView(
        controller: _homeScreenViewModel.pageController,
        onPageChanged: _homeScreenViewModel.onPageChanged,
        children: pageView,
        scrollBehavior: MyBehavior(),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBottomNavigationBar() {
    return BaseView<HomeScreenViewModel>(
      builder: (context, model, _) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: model.currentIndex,
          onTap: (value) {
            model.toPageIndex(value);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              label: "Cart",
              activeIcon: Badge(
                badgeColor: kPrimaryColor,
                badgeContent: Text(
                  model.totalCartProducts.toString(),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                child: Icon(
                  Icons.shopping_bag,
                ),
              ),
              icon: Badge(
                badgeColor: Colors.grey,
                badgeContent: Text(
                  model.totalCartProducts.toString(),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                child: Icon(Icons.shopping_bag),
              ),
            ),
            BottomNavigationBarItem(
              label: "Liked product",
              activeIcon: Badge(
                badgeColor: kPrimaryColor,
                badgeContent: Text(
                  model.totalLikedProducts.toString(),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                child: Icon(
                  Icons.favorite,
                ),
              ),
              icon: Badge(
                badgeColor: Colors.grey,
                badgeContent: Text(
                  model.totalLikedProducts.toString(),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                child: Icon(Icons.favorite_border),
              ),
            ),
          ],
        );
      },
      model: _homeScreenViewModel,
    );
  }

  final List<Widget> pageView = [
    ShopPage(),
    CartPage(),
    FavPage(),
  ];
}
