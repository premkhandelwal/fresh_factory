import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh/businessLogic/cubits/orderCubit/order_cubit.dart';

class AllOrdersWidget extends StatelessWidget {
  const AllOrdersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderCubit = BlocProvider.of<OrderCubit>(context);

    return WillPopScope(
      onWillPop: () {
        orderCubit.statusOrderWidgetClicked(-1);
        return Future.value(false);
      },
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              orderCubit.statusOrderWidgetClicked(1);
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 63,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey),
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bell Pepper Red",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "1 kg Price",
                          style: TextStyle(color: Colors.black26),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "12-01-2022",
                          style: TextStyle(color: Colors.black38),
                        ),
                        SizedBox(height: 7),
                        Text(
                          "\u{20B9}40.00",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
