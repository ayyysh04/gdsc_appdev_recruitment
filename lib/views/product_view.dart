import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gdsc_appdev/components/likebutton.dart';
import 'package:gdsc_appdev/services/locator.dart';
import 'package:gdsc_appdev/view_models/home_screen_view_model.dart';
import 'package:gdsc_appdev/views/base_view/base_view.dart';

class ProductView extends StatelessWidget {
  final model = locator.get<HomeScreenViewModel>();
  ProductView({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Hero(
              tag: model.productAtIndex(index).productID,
              child: Container(
                height: 700,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(model.productAtIndex(index).productURL),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButton(),
                BaseView<HomeScreenViewModel>(
                    model: model,
                    builder: (context, model, _) {
                      return LikeButton(
                          onPressed: () {
                            model.likebutton(
                                model.productAtIndex(index).productID);
                          },
                          isLiked: model.productAtIndex(index).isLiked);
                    })
              ],
            ),
          ),
          Positioned(
              left: 10,
              right: 10,
              bottom: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sub total \nRs ${model.productAtIndex(index).price}",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  BaseView<HomeScreenViewModel>(
                      model: model,
                      builder: (context, model, _) {
                        return TextButton(
                          onPressed: () {
                            model.addToCartbutton(
                                model.productAtIndex(index).productID);
                          },
                          child: Container(
                            height: 60,
                            // width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            decoration: BoxDecoration(
                              color: Colors.orange[600],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              model.checkInCart(
                                      model.productAtIndex(index).productID)
                                  ? "Remove from Cart"
                                  : "Add to Cart",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      }),
                ],
              ))
        ],
      ),
    );
  }
}
