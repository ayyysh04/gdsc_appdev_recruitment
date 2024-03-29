import 'package:flutter/material.dart';
import 'package:gdsc_appdev/components/scroll_behaviour.dart';
import 'package:gdsc_appdev/constants/constants.dart';
import 'package:gdsc_appdev/services/locator.dart';
import 'package:gdsc_appdev/view_models/home_screen_view_model.dart';
import 'package:gdsc_appdev/views/base_view/base_view.dart';

class FavPage extends StatelessWidget {
  final model = locator.get<HomeScreenViewModel>();

  FavPage({Key? key}) : super(key: key);
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
                    "Liked Products",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  BaseView<HomeScreenViewModel>(
                      model: model,
                      builder: (context, model, _) {
                        return Text(
                          "${model.totalLikedProducts} items",
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
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: BaseView<HomeScreenViewModel>(
                model: model,
                builder: (context, model, _) {
                  return Column(
                    children: [
                      Expanded(
                        flex: 9,
                        child: model.totalLikedProducts == 0
                            ? Center(
                                child: Text("No Product Liked"),
                              )
                            : ScrollConfiguration(
                                behavior: MyBehavior(),
                                child: ListView.separated(
                                  itemCount: model.totalLikedProducts,
                                  itemBuilder: (context, index) {
                                    return MaterialButton(
                                        onPressed: () =>
                                            model.goToProductScreen(model
                                                .productIndexAtProductID(model
                                                    .getLikedProductAtIndex(
                                                        index)
                                                    .productID)),
                                        child: Row(
                                          children: [
                                            Hero(
                                              tag: model
                                                  .productAtIndex(index)
                                                  .productID,
                                              child: Container(
                                                height: 100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    image: DecorationImage(
                                                        image: NetworkImage(model
                                                            .getLikedProductAtIndex(
                                                                index)
                                                            .productURL),
                                                        fit: BoxFit.fill)),
                                              ),
                                            ),
                                            Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(model
                                                    .getLikedProductAtIndex(
                                                        index)
                                                    .name),
                                                Text("Rs" +
                                                    model
                                                        .getLikedProductAtIndex(
                                                            index)
                                                        .price
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
                                                    model.removeLike(index);
                                                  },
                                                )
                                              ],
                                            )
                                          ],
                                        ));
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return Divider();
                                  },
                                ),
                              ),
                      ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       "Sub total:",
                      //       style: TextStyle(color: Colors.grey[500]),
                      //     ),
                      //     Text(
                      //       "Rs " + model.subtotal().toString(),
                      //       style:
                      //           Theme.of(context).textTheme.headline5!.copyWith(
                      //                 fontWeight: FontWeight.bold,
                      //               ),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       "Shipping charges",
                      //       style: TextStyle(color: Colors.grey[500]),
                      //     ),
                      //     Text(
                      //       "Rs 100",
                      //       style: Theme.of(context)
                      //           .textTheme
                      //           .headline5!
                      //           .copyWith(fontWeight: FontWeight.bold),
                      //     )
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      // Divider(
                      //   thickness: 2,
                      // ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       "Bag Total:",
                      //       style: TextStyle(color: Colors.grey[500]),
                      //     ),
                      //     Text(
                      //       "Rs ${model.subtotal() + 100}",
                      //       style: Theme.of(context)
                      //           .textTheme
                      //           .headline5!
                      //           .copyWith(fontWeight: FontWeight.bold),
                      //     )
                      //   ],
                      // ),
                      // TextButton(
                      //     onPressed: () {
                      //       ScaffoldMessenger.of(context).clearSnackBars();
                      //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //           content:
                      //               Text("Buying is not suported currently")));
                      //     },
                      //     child: Container(
                      //       height: 60,
                      //       width: double.infinity,
                      //       padding: EdgeInsets.symmetric(
                      //           horizontal: 20, vertical: 20),
                      //       decoration: BoxDecoration(
                      //         color: Colors.orange[600],
                      //         borderRadius: BorderRadius.circular(20),
                      //       ),
                      //       child: Center(
                      //         child: Text(
                      //           "Checkout",
                      //           style: Theme.of(context)
                      //               .textTheme
                      //               .bodyText2!
                      //               .copyWith(
                      //                   color: Colors.white,
                      //                   fontSize: 15,
                      //                   fontWeight: FontWeight.bold),
                      //         ),
                      //       ),
                      //     )),
                    ],
                  );
                }),
          ),
        ),
      ],
    );
  }
}
