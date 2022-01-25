import 'package:flutter/material.dart';
import 'package:gdsc_appdev/components/scroll_behaviour.dart';
import 'package:gdsc_appdev/constants/constants.dart';
import 'package:gdsc_appdev/services/locator.dart';
import 'package:gdsc_appdev/view_models/home_screen_view_model.dart';
import 'package:gdsc_appdev/views/base_view/base_view.dart';

class CartPage extends StatelessWidget {
  final model = locator.get<HomeScreenViewModel>();

  CartPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 80,
          padding: EdgeInsets.fromLTRB(
              kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
          color: kPrimaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Cart",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  BaseView<HomeScreenViewModel>(
                      model: model,
                      builder: (context, model, _) {
                        return Text(
                          "${model.totalCartProducts} items",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        );
                      })
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 9,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: BaseView<HomeScreenViewModel>(
                model: model,
                builder: (context, model, _) {
                  return Column(
                    children: [
                      Expanded(
                        flex: 9,
                        child: model.totalCartProducts == 0
                            ? Center(
                                child: Text("No Product Added"),
                              )
                            : ScrollConfiguration(
                                behavior: MyBehavior(),
                                child: ListView.separated(
                                  itemCount: model.totalCartProducts,
                                  itemBuilder: (context, index) {
                                    return MaterialButton(
                                      onPressed: () => model.goToProductScreen(
                                          model.productIndexAtProductID(model
                                              .getCartProductAtIndex(index)
                                              .ProductID)),
                                      child: Row(
                                        children: [
                                          Hero(
                                            tag: model
                                                .productAtIndex(index)
                                                .ProductID,
                                            child: Container(
                                              height: 120,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  image: DecorationImage(
                                                      image: NetworkImage(model
                                                          .getCartProductAtIndex(
                                                              index)
                                                          .ProductURL),
                                                      fit: BoxFit.fill)),
                                            ),
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(model
                                                  .getCartProductAtIndex(index)
                                                  .Name),
                                              Text("Rs" +
                                                  model
                                                      .getCartProductAtIndex(
                                                          index)
                                                      .Price
                                                      .toString()),
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            children: [
                                              GestureDetector(
                                                child: Icon(Icons.delete,
                                                    color: Colors.red[400]),
                                                onTap: () {
                                                  model.removeFromCart(index);
                                                },
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return Divider();
                                  },
                                ),
                              ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sub total:",
                            style: TextStyle(color: Colors.grey[500]),
                          ),
                          Text(
                            "Rs " + model.subtotal().toString(),
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Shipping charges",
                            style: TextStyle(color: Colors.grey[500]),
                          ),
                          Text(
                            "Rs 100",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Bag Total:",
                            style: TextStyle(color: Colors.grey[500]),
                          ),
                          Text(
                            "Rs ${model.subtotal() + 100}",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content:
                                    Text("Buying is not suported currently")));
                          },
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            decoration: BoxDecoration(
                              color: Colors.orange[600],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Checkout",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    ],
                  );
                }),
          ),
        ),
      ],
    );
  }
}
