import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh/businessLogic/cubits/radioButtonCubit/radio_button_cubit.dart';
import 'package:fresh/businessLogic/cubits/sortFilterProduct/sort_filter_product_cubit.dart';
import 'package:fresh/data/enums.dart';
import 'package:fresh/data/models/item.dart';
import 'package:fresh/presentation/screens/products/products_page.dart';
import 'package:fresh/presentation/utils/custom_app_bar.dart';

class SortFilterProductPage extends StatefulWidget {
  const SortFilterProductPage({Key? key}) : super(key: key);

  @override
  _SortFilterProductPageState createState() => _SortFilterProductPageState();
}

class _SortFilterProductPageState extends State<SortFilterProductPage> {
  int currIndex = -1;
  late SortFilterProductCubit sortFilterProductCubit;
  late RadioButtonCubit radioButtonCubit;
  @override
  void initState() {
    sortFilterProductCubit = BlocProvider.of<SortFilterProductCubit>(context);
    radioButtonCubit = BlocProvider.of<RadioButtonCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Vegetables"),
      body: DefaultTabController(
        length: 2,
        child: BlocConsumer<SortFilterProductCubit, SortFilterProductState>(
          listener: (context, state) {
            if (state is TabBarSelectionChanged) {
              if (state.tabIndex == 0) {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) =>
                        BlocBuilder<RadioButtonCubit, RadioButtonState>(
                          builder: (context, state) {
                            return SingleChildScrollView(
                              child: Column(
                                  children: List<Widget>.from(
                                SortOptions.values.map(
                                  (e) {
                                    return Column(
                                      children: [
                                        e.index == 0
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                      "Sort",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    IconButton(
                                                        onPressed: () {
                                                          Navigator.pop(ctx);
                                                        },
                                                        icon: Icon(Icons.close))
                                                  ],
                                                ),
                                              )
                                            : Container(),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                e.value,
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              Radio<SortOptions>(
                                                  value: e,
                                                  groupValue: state.sortOptionVal,
                                                  onChanged: (val) {
                                                    radioButtonCubit
                                                        .sortOptionSelected(val);
                                                  })
                                            ],
                                          ),
                                        ),
                                      ],
                                    ); /* RadioListTile<SortOptions>(
                                        value: e,
                                        groupValue: state.sortOptionVal,
                            
                                        title: Text(e.value),
                                        onChanged: (val) {
                                          radioButtonCubit
                                              .sortOptionSelected(val);
                                        }); */
                                  },
                                ).toList(),
                              )),
                            );
                          },
                        ));
              } else if (state.tabIndex == 1) {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) =>
                        BlocBuilder<RadioButtonCubit, RadioButtonState>(
                          builder: (context, state) {
                            return Column(
                                children: List<Widget>.from(
                              FilterOptions.values.map(
                                (e) {
                                  return Column(
                                    children: [
                                      e.index == 0
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                      child: Text(
                                                    "Filter",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                  IconButton(
                                                      onPressed: () {
                                                        Navigator.pop(ctx);
                                                      },
                                                      icon: Icon(Icons.close))
                                                ],
                                              ),
                                            )
                                          : Container(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              e.value,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Radio<FilterOptions>(
                                                value: e,
                                                groupValue:
                                                    state.filterOptionVal,
                                                onChanged: (val) {
                                                  radioButtonCubit
                                                      .filterOptionSelected(
                                                          val);
                                                })
                                          ],
                                        ),
                                      ),
                                    ],
                                  ); /* RadioListTile<SortOptions>(
                                      value: e,
                                      groupValue: state.sortOptionVal,

                                      title: Text(e.value),
                                      onChanged: (val) {
                                        radioButtonCubit
                                            .sortOptionSelected(val);
                                      }); */
                                },
                              ).toList(),
                            ));
                          },
                        ));
              }
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Color(0xff02096B),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      // backgroundBlendMode:
                    ),
                    child: TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.indigo),
                      onTap: (index) {
                        // Tab index when user select it, it start from zero

                        sortFilterProductCubit.changeTabIndex(index);
                      },
                      tabs: const [
                        Tab(
                          child: Text("Sort"),
                        ),
                        Tab(
                          child: Text("Filter"),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: TabBarView(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      itemCount: 10,
                      // shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          // childAspectRatio: 170 / 230,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 10),
                      itemBuilder: (ctx, ind) {
                        return Stack(
                          children: [
                            ind == 0 || ind == 5
                                ? Positioned(
                                    top: 10,
                                    left: 0,
                                    child: Container(
                                      height: 30,
                                      width: ind == 5 ? 70 : 50,
                                      // padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          color: ind == 5
                                              ? Colors.grey
                                              : Color(0xff02096B),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Center(
                                        child: Text(
                                          ind == 5 ? "Out of Stock" : "20% off",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                            Opacity(
                              opacity: ind == 5 ? 0.6 : 1,
                              child: ProductWidget(
                                product: Item(
                                  id: "",
                                  mrp: 140,
                                  minPurchaseQty: 2,
                                  name: "Banana",
                                ),
                                isDiscount: ind == 0,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          // childAspectRatio: 170 / 200,
                          mainAxisExtent: MediaQuery.of(context).size.width / 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5),
                      itemBuilder: (ctx, ind) {
                        return ProductWidget(
                          product: Item(
                            id: "",
                            mrp: 140,
                            minPurchaseQty: 2,
                            name: "Banana",
                          ),
                          isDiscount: ind == 0,
                        );
                      },
                    ),
                  )
                ]))
              ],
            );
          },
        ),
      ),
    );
  }
}
