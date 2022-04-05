import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh/data/models/cart_item.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'package:fresh/businessLogic/cubits/bottomNavigationBar/cart_cubit.dart';
import 'package:fresh/businessLogic/cubits/payCubit/pay_cubit.dart';
import 'package:fresh/data/models/item.dart';
import 'package:fresh/globals/common_function.dart';
import 'package:fresh/globals/constants/secrets.dart';
import 'package:fresh/presentation/screens/home/main_home_page.dart';
import 'package:fresh/presentation/screens/offers/offer_page.dart';
import 'package:fresh/presentation/utils/custom_app_bar.dart';
import 'package:fresh/presentation/utils/custom_header_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late PayCubit payCubit;
  late CartCubit cartCubit;
  @override
  void initState() {
    super.initState();
    payCubit = BlocProvider.of<PayCubit>(context);
    cartCubit = BlocProvider.of<CartCubit>(context);
    payCubit.initPay();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print(response.orderId);
    print(response.paymentId);
    print(response.signature);
    showSnackBar(context, "Successfully Paid");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print(response);

    showSnackBar(context, "Failed to Pay");

    // Do something when payment fails
  }

  @override
  void dispose() {
    super.dispose();
    payCubit.dispose();
  }

  double _amountTobePaid = 140.00;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cartCubit.getCartItems();
  }

  List<Widget> _cartItems = [];

  @override
  Widget build(BuildContext context) {
    cartCubit.getCartItems();
    return Scaffold(
      appBar: CustomAppBar(title: "Cart Page"),
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, cartState) {
          if (cartState is GetCartItemsState) {
            // _cartItems = List.from(cartState.cartItems);
            _cartItems = cartState.cartItems
                .map(
                  (e) => Positioned.fill(
                    child: Expanded(
                      child: Column(
                        children: [
                          CartItemWidget(cartItem: e),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Divider(height: 10, color: Colors.black54),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                )
                .toList();
            _cartItems.add(Positioned(
              bottom: 1,
              left: 15,
              child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Total Amount \u{20B9}140.00",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Proceed to checkout",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        )
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (ctx) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 16.0, top: 12),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: CustomHeaderWidget(
                                                isPaddingReq: false,
                                                title: "Checkout")),
                                        IconButton(
                                            onPressed: () {
                                              Navigator.pop(ctx);
                                            },
                                            icon: Icon(Icons.close))
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    CheckOutModalItemWidget(
                                      leftHeading: "Delivery",
                                      rightHeading: "Select Method",
                                    ),
                                    SizedBox(height: 10),
                                    CheckOutModalItemWidget(
                                      leftHeading: "Wallet",
                                      rightHeading: "\u{20B9} 1040.00",
                                    ),
                                    SizedBox(height: 10),
                                    CheckOutModalItemWidget(
                                      leftHeading: "Promo Code",
                                      rightHeading: "Pick Discount",
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (ctx) => OfferPage()),
                                        );
                                      },
                                    ),
                                    SizedBox(height: 10),
                                    CheckOutModalItemWidget(
                                      leftHeading: "Total Amount",
                                      rightHeading: "\u{20B9} $_amountTobePaid",
                                    ),
                                    SizedBox(height: 40),
                                    ElevatedButton(
                                      onPressed: () {
                                        /* payCubit.getOrderId(_amountTobePaid);
                                                Navigator.pop(ctx); */
                                      },
                                      child: Text("Place Order"),
                                      style: ElevatedButton.styleFrom(
                                          fixedSize: Size(353, 50)),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                    )
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(353, 65),
                    padding:
                        EdgeInsets.symmetric(vertical: 16, horizontal: 12)),
              ),
            ));
            // _cartItems = List.from(cartState.cartItems);

          }
        },
        builder: (context, cartState) {
          if (_cartItems.isNotEmpty) {
            return BlocConsumer<PayCubit, PayState>(
              listener: (context, state) {
                if (state is PaymentSuccessState) {
                  _handlePaymentSuccess(state.paymentSuccessResponse);
                } else if (state is PaymentErrorState) {
                  _handlePaymentError(state.paymentFailureResponse);
                } else if (state is GetOrderIdSuccessState) {
                  payCubit.openCheckOut(_amountTobePaid, state.orderId);
                }
              },
              builder: (context, state) {
                if (state is GetOrderIdInProgressState) {
                  return Center(child: CircularProgressIndicator());
                }
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                  child: Column(children: _cartItems),
                );
              },
            );
          }
          return Center(
            child: Text("No Items in the Cart"),
          );
        },
      ),
    );
  }
}

class CheckOutModalItemWidget extends StatelessWidget {
  final String leftHeading;
  final String rightHeading;
  final void Function()? onTap;
  const CheckOutModalItemWidget(
      {Key? key,
      required this.leftHeading,
      required this.rightHeading,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(leftHeading)),
        GestureDetector(onTap: onTap, child: Text(rightHeading)),
        IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          onPressed: onTap,
        )
      ],
    );
  }
}

class CartItemWidget extends StatefulWidget {
  final CartItem cartItem;
  const CartItemWidget({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  double noOfItems = 0;
  @override
  void initState() {
    super.initState();
    noOfItems = widget.cartItem.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.cartItem.item.image != null
                ? Center(
                    child: Image.network(
                      Secrets.mediaUrl + widget.cartItem.item.image!,
                      height: 64,
                      width: 70,
                      errorBuilder: (ctx, _, _1) {
                        return Container(
                          height: 28,
                          width: 43,
                        );
                      },
                    ),
                  )
                : Container(
                    height: 64,
                    width: 70,
                    decoration: BoxDecoration(color: Colors.grey),
                  ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(widget.cartItem.item.name),
                widget.cartItem.item.minPurchaseQty != null
                    ? Text(widget.cartItem.item.minPurchaseQty.toString())
                    : Container(),
                SizedBox(height: 10),
                widget.cartItem.item.mrp != null
                    ? Text("\u{20B9} ${widget.cartItem.item.mrp}")
                    : Container()
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        noOfItems -= 1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xff02096B))),
                      child: Text("-"),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff02096B)),
                        color: const Color(0xff02096B)),
                    child: Text(
                      noOfItems.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        noOfItems += 1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xff02096B))),
                      child: Text("+"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
