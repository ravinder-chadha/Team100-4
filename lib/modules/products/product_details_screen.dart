import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/modules/products/deepAR.dart';
import 'package:flutter_shop_app/modules/products/size_selector.dart';

import '/models/carts_model.dart';
import '/shared/constant/constant.dart';
import '/layout/shop_layout/cubit/cubit.dart';
import '/layout/shop_layout/cubit/states.dart';
import '/models/home_model.dart';
import '/shared/components/components.dart';

class ProductsDatailsScreen extends StatefulWidget {
  final ProductModel model;
 const ProductsDatailsScreen({
    required this.model,
    Key? key,
  }) : super(key: key);
  @override
  State<ProductsDatailsScreen> createState() => _ProductsDatailsScreenState();
}
class _ProductsDatailsScreenState extends State<ProductsDatailsScreen> {
  String selectedSize = "L";
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (ctx, state) {},
      builder: (ctx, state) {
        var cubit = ShopCubit.get(ctx);
        return Directionality(
          textDirection:
              cubit.appLanguage == 'en' ? TextDirection.ltr : TextDirection.rtl,
          child: WillPopScope(
            onWillPop: () async {
              cubit.currentIndexCarouselSlider = 0;
              cubit.cartQuantity = 1;
              return true;
            },
            child: OrientationBuilder(
              builder: (context, orientation) => Scaffold(
                body: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      actions: [
                        IconButton(
                          iconSize: 24,
                          onPressed: () {
                            cubit.changeFavoriteIcon(widget.model.productID!);
                          },
                          icon: cubit.favoritesMap[widget.model.productID!]!
                              ? Icon(
                                  Icons.favorite,
                                  color: cubit.primaryColor,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                  color: Colors.black87,
                                ),
                        ),
                      ],
                      backgroundColor: Theme.of(ctx).scaffoldBackgroundColor,
                      iconTheme: IconThemeData(color: cubit.primaryColor),
                      pinned: true,
                      expandedHeight:
                          orientation == Orientation.portrait ? null : 240,
                      collapsedHeight:
                          orientation == Orientation.portrait ? 240 : 120,
                      flexibleSpace: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0),
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            CarouselSlider(
                              items: widget.model.images!.map(
                                    (element) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 30.0,
                                        ),
                                        child: buildCachedNetworkImage(
                                          urlImage: element.toString(),
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                      );
                                    },
                                  ).toList() +
                                  [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 30.0,
                                      ),
                                      child: buildCachedNetworkImage(
                                        urlImage:
                                            "https://skotfashion.com/wp-content/uploads/2021/04/Size-Guide-Shirt-slim-fit21-1.png",
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                                    ),
                                  ],
                              options: CarouselOptions(
                                height: 255,
                                enlargeCenterPage: true,
                                viewportFraction: 1.0,
                                onPageChanged: (indexVal, _) {
                                  cubit.changeIndexCarouselSlider(indexVal);
                                },
                              ),
                            ),
                            ////////////////////
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: DotsIndicator(
                                dotsCount: widget.model.images!.length + 1,
                                position:
                                    cubit.currentIndexCarouselSlider.toDouble(),
                                decorator: DotsDecorator(
                                  color: Colors.grey, // Inactive color
                                  activeColor: cubit.primaryColor,
                                  size: const Size.square(10.0),
                                  activeSize: const Size.square(13.0),
                                ),
                              ),
                            ),
                            ////////////////////
                          ],
                        ),
                      ),
                    ),
                    //////////////////////////////////////
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 5.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.model.name!,
                                  style: defaultTextStyle(
                                    color: cubit.textColor,
                                    fontSize: 22,
                                  ),
                                ),
                                ///////////
                                const SizedBox(height: 15),
                                ///////////
                                Text(
                                  widget.model.description!,
                                  style: defaultTextStyle(
                                    color: cubit.themeMode == ThemeMode.dark
                                        ? Colors.grey[350]!
                                        : Colors.grey[800]!,
                                  ),
                                ),
                                Text(
                                  "\nSuggested Size according to your previous purchases: L",
                                  style: defaultTextStyle(
                                    color: cubit.themeMode == ThemeMode.dark
                                        ? Colors.orange[350]!
                                        : Colors.orange[800]!,
                                    fontSize: 12,
                                  ),
                                ),
                                SizeSelector(
                                    sizes: const ["S", "M", "L", "XL", "XXL"],
                                    selectedSize: selectedSize,
                                    onSizeSelected: (size) {
                                      setState(() {
                                        selectedSize = size;
                                      });
                                    }),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                /////////////////////////////
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.endFloat,
                floatingActionButton: FloatingActionButton(
                  backgroundColor: cubit.primaryColor,
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const DeepAr(),
                    //   ),
                    // );
                  },
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                ),
                /////////////////////////////
                bottomNavigationBar: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 10.0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            defaultIconButton(
                              backColor: cubit.primaryColor,
                              onPressed: () {
                                if (cubit.cartQuantity != 1) {
                                  cubit.changeCartQuantityValue(
                                      cartQuantity: --cubit.cartQuantity);
                                }
                              },
                              iconData: Icons.remove,
                              iconSize: 18.0,
                            ),
                            //////////
                            Text(
                              '  ${(widget.model.price).round()}',
                              style: defaultTextStyle(
                                fontSize: 20,
                                color: cubit.textColor,
                              ),
                            ),
                            //////////
                            Text(
                              ' X ${cubit.cartQuantity}  ',
                              style: defaultTextStyle(
                                fontSize: 20,
                                color: cubit.themeMode == ThemeMode.dark
                                    ? Colors.grey[400]!
                                    : Colors.grey[600]!,
                              ),
                            ),
                            defaultIconButton(
                              backColor: cubit.primaryColor,
                              onPressed: () {
                                cubit.changeCartQuantityValue(
                                    cartQuantity: ++cubit.cartQuantity);
                              },
                              iconData: Icons.add,
                              iconSize: 18.0,
                            ),
                            //////////
                          ],
                        ),
                      ),
                      ///////////////
                      const Spacer(),
                      ////////////////
                      Stack(
                        children: [
                          defaultOutlinedButton(
                            backColor: cubit.primaryColor,
                            isUpperCase: false,
                            width: 150,
                            height: 45,
                            btnText: appWords['addCart'][cubit.appLanguage],
                            btnFunction: () {
                              if (cubit.cartsMap[widget.model.productID]!) {
                                CartItemModel cartItem = cubit
                                    .cartsModel!.data!.cartItems
                                    .firstWhere(
                                  (cart) =>
                                      widget.model.productID ==
                                      cart.product!.productID,
                                );
                                cubit
                                    .updateCartQuantity(
                                      cartItem.cartID!,
                                      cartItem.quantity! + cubit.cartQuantity,
                                    )
                                    .then((value) => Navigator.pop(ctx));
                              } else {
                                cubit
                                    .addOrRemoveCartData(widget.model.productID!)
                                    .then((value) => Navigator.pop(ctx));
                              }
                              showToast(
                                message: appWords['messageAdding']
                                    [cubit.appLanguage],
                                state: ToastStates.SUCCESS,
                              );
                              //////////////////
                              cubit.currentIndexCarouselSlider = 0;
                              cubit.cartQuantity = 1;
                            },
                            icon: Image.asset(
                              'assets/images/cartIcon.png',
                              width: 28,
                              height: 28,
                              color: Colors.white,
                            ),
                          ),
                          ////////////////
                          if (state is ShopUpdateCartDataSuccessState ||
                              state is ShopUpdateCartQuantityLoadingState ||
                              state is ShopUpdateCartQuantitySuccessState)
                            Container(
                              width: 150,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
