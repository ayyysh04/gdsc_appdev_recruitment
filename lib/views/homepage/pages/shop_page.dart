import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gdsc_appdev/components/filled_outline_button.dart';
import 'package:gdsc_appdev/components/scroll_behaviour.dart';
import 'package:gdsc_appdev/constants/constants.dart';
import 'package:gdsc_appdev/enums/viewstate.dart';
import 'package:gdsc_appdev/services/locator.dart';
import 'package:gdsc_appdev/view_models/home_screen_view_model.dart';
import 'package:gdsc_appdev/views/base_view/base_view.dart';

class ShopPage extends StatelessWidget {
  final model = locator.get<HomeScreenViewModel>();

  ShopPage({Key? key}) : super(key: key);
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
            children: [
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2),
                  text: "Find your \n",
                  children: <InlineSpan>[
                    TextSpan(
                        text: 'match style!',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
        Spacer(
          flex: 1,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                FillOutlineButton(press: () {}, text: "Trending  now"),
                SizedBox(width: kDefaultPadding),
                FillOutlineButton(
                  press: () {},
                  text: "2021 New In",
                  isFilled: false,
                ),
                SizedBox(width: kDefaultPadding),
                FillOutlineButton(
                  press: () {},
                  text: "TikTok",
                  isFilled: false,
                ),
              ],
            ),
          ),
        ),
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 20,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child:
                  BaseView<HomeScreenViewModel>(builder: (context, model, _) {
                return model.state == ViewState.Busy
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : StaggeredGridView.countBuilder(
                        staggeredTileBuilder: (index) {
                          return StaggeredTile.count(
                              1, index.isEven ? 1.4 : 1.8);
                        },
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        itemCount: model.totalProducts,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: NetworkImage(model
                                              .productAtIndex(index)
                                              .ProductURL),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top: 5,
                                        right: 5,
                                        child: MaterialButton(
                                          minWidth: 50,
                                          shape: CircleBorder(),
                                          color: Colors.white,
                                          elevation: 0,
                                          padding: EdgeInsets.all(8.0),
                                          onPressed: () {
                                            model.likebutton(model
                                                .productAtIndex(index)
                                                .ProductID);
                                          },
                                          child: model
                                                  .productAtIndex(index)
                                                  .isLiked
                                              ? Icon(
                                                  Icons.favorite,
                                                  color: Colors.red,
                                                )
                                              : Icon(
                                                  Icons
                                                      .favorite_border_outlined,
                                                ),
                                        )),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  model.productAtIndex(index).Name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5.0, bottom: 5),
                                child: Text(
                                  "Rs " +
                                      model
                                          .productAtIndex(index)
                                          .Price
                                          .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          );
                        },
                      );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
