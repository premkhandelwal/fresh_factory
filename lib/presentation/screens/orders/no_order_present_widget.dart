import 'package:flutter/material.dart';

class NoOrderPresentWidget extends StatefulWidget {
  static String route = '/noOrderScreen';
  const NoOrderPresentWidget({ Key? key }) : super(key: key);

  @override
  State<NoOrderPresentWidget> createState() => _NoOrderPresentWidgetState();
}

class _NoOrderPresentWidgetState extends State<NoOrderPresentWidget> {
  final noOrderImage = AssetImage('assets/noCurrentOrders.png');

  @override
  Widget build(BuildContext context) {
    return Column(
                        children: [
                          Image(image: noOrderImage),
                          Text('There is no ongoing order right now.',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff02096B))),
                          SizedBox(height: 10),
                          Text('You can order from home',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff02096B))),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                style: TextStyle(fontSize: 20),
                                text:
                                    "There is no ongoing order right now.\nYou can order from home"),
                            TextSpan(
                                text:
                                    "There is no ongoing order right now.\nYou can order from home")
                          ])),
                          ElevatedButton(
                            onPressed: () {
                             /*  setState(() {
                                orderPresent = true;
                              }); */
                            },
                            child: Text("Change Status"),
                            style: ElevatedButton.styleFrom(),
                          ),
                        ],
                      );
  }
}