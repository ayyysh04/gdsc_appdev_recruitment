import 'package:flutter/material.dart';
import 'package:gdsc_appdev/components/scroll_behaviour.dart';
import 'package:gdsc_appdev/services/locator.dart';
import 'package:gdsc_appdev/view_models/home_screen_view_model.dart';
import 'package:gdsc_appdev/views/base_view/base_view.dart';
import 'package:gdsc_appdev/views/homepage/components/cart_page.dart';
import 'package:gdsc_appdev/views/homepage/components/shop_page.dart';

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

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        "ShopSella",
      ),
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
            model.setIndex(value);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: "Cart"),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        );
      },
      model: _homeScreenViewModel,
    );
  }

  List<Widget> pageView = [
    ShopPage(),
    CartPage(),
    Container(),
  ];
}
