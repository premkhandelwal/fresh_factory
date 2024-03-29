import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh/businessLogic/blocs/product/product_bloc.dart';
import 'package:fresh/config/args.dart';
import 'package:fresh/data/models/item_details.dart';
import 'package:fresh/globals/common_function.dart';
import 'package:fresh/globals/constants/secrets.dart';
import 'package:fresh/presentation/utils/custom_app_bar.dart';

import '../../../businessLogic/cubits/cartCubit/cart_cubit.dart';

class ProductDetailPage4 extends StatefulWidget {
  static String route = '/productDetailPage4Screen';

  const ProductDetailPage4({
    Key? key,
  }) : super(key: key);

  @override
  _ProductDetailPage4State createState() => _ProductDetailPage4State();
}

class _ProductDetailPage4State extends State<ProductDetailPage4> {
  final productBig = AssetImage("assets/product_detail_big.png");
  final productSmall = AssetImage("assets/product_detail_small.png");

  late ProductBloc productBloc;
  late ProductDetailPage4Args args;
  late CartCubit cartCubit;
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      cartCubit = BlocProvider.of<CartCubit>(context);

      productBloc = BlocProvider.of<ProductBloc>(context);
      productBloc.add(FetchProductDetailsEvent(itemId: args.item.id));
    });
    super.initState();
  }

  int quantity = 1;
  ItemDetails _itemList = ItemDetails(imageList: [], attributes: []);
  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as ProductDetailPage4Args;

    return Scaffold(
      appBar: CustomAppBar(title: "Vegetables"),
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is AddtoCartSuccessState) {
            showSnackBar(context, "Item added to cart");
          }
          if (state is FetchProductDetailSuccessState) {
            _itemList = state.itemList;
          }
        },
        builder: (context, state) {
          if (state is FetchProductDetailInProgressState ||
              state is AddtoCartInProgressState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is FetchProductDetailSuccessState ||
              state is AddtoCartSuccessState) {
            return ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 413,
                  height: 371,
                  decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(30))),
                  child: Stack(
                    children: [
                      args.item.image != null
                          ? Center(
                              child: Image.network(
                                Secrets.mediaUrl + args.item.image!,
                                // height: 500,
                                // width: 309,
                                errorBuilder: (ctx, _, _1) {
                                  return Container(
                                    height: 28,
                                    width: 43,
                                  );
                                },
                              ),
                            )
                          : Container(
                              height: 28,
                              width: 43,
                            ),
                      Positioned(
                          bottom: 30,
                          left: 20,
                          child: Row(
                              children: List.from(_itemList.imageList)
                                  .map(
                                    (e) => Row(
                                      children: [
                                        Container(
                                          width: 70,
                                          height: 56,
                                          decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Center(
                                            child: Image.network(
                                              Secrets.mediaUrl + e,
                                              height: 100,
                                              width: 129,
                                              errorBuilder: (ctx, _, _1) {
                                                return Container(
                                                  height: 28,
                                                  width: 43,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                      ],
                                    ),
                                  )
                                  .toList() /* [
                                Container(
                                  width: 70,
                                  height: 56,
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Image(image: productSmall),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  width: 70,
                                  height: 56,
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Image(image: productSmall),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  width: 70,
                                  height: 56,
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Image(image: productSmall),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  width: 70,
                                  height: 56,
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                      child: Text(
                                    "+3",
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.grey),
                                  )),
                                ),
                                SizedBox(width: 10),
                              ], */
                              ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              args.item.name,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                quantity -= 1;
                              });
                            },
                            child: Text(
                              "-",
                              style:
                                  TextStyle(fontSize: 60, color: Colors.grey),
                            ),
                          ),
                          SizedBox(width: 15),
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                // Colors.grey
                                border: Border.all(color: Color(0xFFBDBDBD)),
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(quantity.toString()),
                          ),
                          SizedBox(width: 15),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                quantity += 1;
                              });
                            },
                            child: Text(
                              "+",
                              style: TextStyle(
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                      _itemList.attributes.isNotEmpty
                          ? Divider(
                              height: 40,
                              color: Colors.grey,
                            )
                          : Container(),
                      /*   RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Color: ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "Blue",
                              style:
                                  TextStyle(color: Colors.black54, fontSize: 15)),
                        ])), */
                      SizedBox(height: 20),
                      Column(
                        children: List.from(_itemList.attributes).map(
                          (e) {
                            print(e);
                            return RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "${e["value"]}: ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: e["unit"],
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 15)),
                            ]));
                          },
                        ).toList(),
                      ),
                      /* RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Size: ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)), 
                          TextSpan(
                              text: "2GB",
                              style:
                                  TextStyle(color: Colors.black54, fontSize: 15)),
                        ])),*/
                      Divider(
                        height: 40,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          for (var i = 0; i < quantity; i++) {
                            cartCubit.addToCart(args.item);
                          }
                          productBloc.add(AddToCartEvent(
                              item: args.item, quantity: quantity));
                        },
                        child: Text("Add to Basket"),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(353, 65),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }
          return Center(
            child: Text("Failed to fetch details"),
          );
        },
      ),
    );
  }
}
