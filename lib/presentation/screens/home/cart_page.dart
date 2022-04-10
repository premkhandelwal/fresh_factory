import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh/businessLogic/cubits/cartCubit/cart_cubit.dart';
import 'package:fresh/config/args.dart';
import 'package:fresh/data/models/cart_item.dart';
import 'package:fresh/globals/constants/sessionConstants.dart';
import 'package:fresh/presentation/screens/orders/order_main_page.dart';
import 'package:fresh/presentation/screens/payments/wallet_screen.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'package:fresh/businessLogic/cubits/payCubit/pay_cubit.dart';
import 'package:fresh/globals/common_function.dart';
import 'package:fresh/globals/constants/secrets.dart';
import 'package:fresh/presentation/screens/offers/offer_page.dart';
import 'package:fresh/presentation/utils/custom_app_bar.dart';
import 'package:fresh/presentation/utils/custom_header_widget.dart';

class CartPage extends StatefulWidget{
  static String route = '/cartScreen';

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
    _cartItems = cartCubit.getCartItems
        .map(
          (e) => Column(
            children: [
              CartItemWidget(cartItem: e),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Divider(height: 10, color: Colors.black54),
              ),
              SizedBox(height: 20),
            ],
          ),
        )
        .toList();
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

  List<Widget> _cartItems = [];

  List<Widget> _createChildren() {
    return new List<Widget>.from(_cartItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Cart Page"),
        body: BlocBuilder<CartCubit, CartState>(
          buildWhen: (previous, current) {
            if (current is AddNewtoCartState) {
              _cartItems.add(Column(
                children: [
                  CartItemWidget(
                      cartItem: CartItem(
                          item: current.item, quantity: current.quantity)),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Divider(height: 10, color: Colors.black54),
                  ),
                  SizedBox(height: 20),
                ],
              ));
              return true;
            }
            return false;
          },
          builder: (context, state) {
            return _cartItems.isNotEmpty
                ? BlocConsumer<PayCubit, PayState>(
                    listener: (context, state) {
                      if (state is PaymentSuccessState) {
                        _handlePaymentSuccess(state.paymentSuccessResponse);
                      } else if (state is PaymentErrorState) {
                        _handlePaymentError(state.paymentFailureResponse);
                      } else if (state is GetOrderIdSuccessState) {
                        payCubit.openCheckOut(
                            cartCubit.totalAmount, state.orderId);
                      }
                    },
                    builder: (context, state) {
                      if (state is GetOrderIdInProgressState) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 20),
                        child: Stack(children: [
                          ListView(
                            children: _createChildren(),
                          ),
                          Positioned(
                            bottom: 1,
                            left: 15,
                            child: ElevatedButton(
                              onPressed: () {
                                _proceedToCheckOut(context);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BlocBuilder<CartCubit, CartState>(
                                    builder: (context, state) {
                                      return Column(
                                        children: [
                                          Text(
                                            "Total Amount \u{20B9} ${cartCubit.totalAmount}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            "Proceed to checkout",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.arrow_forward_ios),
                                    onPressed: () {
                                      _proceedToCheckOut(context);
                                    },
                                  )
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(353, 65),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 12)),
                            ),
                          )
                        ]),
                      );
                    },
                  )
                : Center(
                    child: Text("No Items in the Cart"),
                  );
          },
        ));
  }

  Future<dynamic> _proceedToCheckOut(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return StatefulBuilder(builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: CustomHeaderWidget(
                              isPaddingReq: false, title: "Checkout")),
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
                    rightHeading: "\u{20B9} ${SessionConstants.walletAmount}",
                  ),
                  SizedBox(height: 10),
                  CheckOutModalItemWidget(
                    leftHeading: "Promo Code",
                    rightHeading: "Pick Discount",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        OfferPage.route,
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  CheckOutModalItemWidget(
                    leftHeading: "Total Amount",
                    rightHeading: "\u{20B9} ${cartCubit.totalAmount}",
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      cartCubit.totalAmount > SessionConstants.walletAmount
                          ? Navigator.pushNamed(
                            context,
                            WalletScreen.route,
                            arguments: WalletScreenArgs(isRedirectedAutomatically: true)
                          )
                          : Navigator.pushNamed(
                              context,
                              OrderMainPage.route,
                            );
                      ;
                    },
                    child: Text("Place Order"),
                    style: ElevatedButton.styleFrom(fixedSize: Size(353, 50)),
                  ),
                ],
              ),
            );
          });
        });
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
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final CartCubit cartCubit = BlocProvider.of<CartCubit>(context);

    //  noOfItems = SessionConstants.cartClass.getIndividualQty(widget.cartItem.item);
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) {
        if (current.item == widget.cartItem.item) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
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
                        onTap: state.quantity > 0
                            ? () {
                                cartCubit.removeFromCart(widget.cartItem.item);
                              }
                            : null,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xff02096B))),
                          child: Text("-"),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff02096B)),
                            color: const Color(0xff02096B)),
                        child: Text(
                          state.quantity.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          cartCubit.addToCart(widget.cartItem.item);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xff02096B))),
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
      },
    );
  }
}
