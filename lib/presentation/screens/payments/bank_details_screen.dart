import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh/businessLogic/blocs/profile/profile_bloc.dart';
import 'package:fresh/data/models/bank_details.dart';
import 'package:fresh/data/models/image_to_file_api.dart';
import 'package:fresh/globals/common_function.dart';
import 'package:fresh/globals/constants/sessionConstants.dart';
import 'package:fresh/presentation/utils/custom_app_bar.dart';
import 'package:fresh/presentation/utils/custom_header_widget.dart';
import 'package:fresh/presentation/widgets/utils/custom_text_field_widget.dart';

class BankDetailsScreen extends StatefulWidget {
  const BankDetailsScreen({Key? key}) : super(key: key);

  @override
  _BankDetailsScreenState createState() => _BankDetailsScreenState();
}

int? val = -1;

class _BankDetailsScreenState extends State<BankDetailsScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final panNoController = TextEditingController();
  final gstNoController = TextEditingController();
  final bankNameController = TextEditingController();
  final bankAccountNoController = TextEditingController();
  final bankCancelledChequeController = TextEditingController();
  final upiIDController = TextEditingController();
  CustomFile? panCard;
  CustomFile? gst;
  CustomFile? cancelledCheque;

  late ProfileBloc profileBloc;
  @override
  void initState() {
    super.initState();
    profileBloc = BlocProvider.of<ProfileBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Bank Details Screen"),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is UpdateBankDetailsSuccessState) {
            showSnackBar(context, "Updated details successfully");
          } else if (state is UpdateBankDetailsFailureState) {
            showSnackBar(context, "Failed to update details");
          }
        },
        builder: (context, state) {
          if (state is UpdateBankDetailsInProgressState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 30),
                  const CustomHeaderWidget(title: "Bank Details"),
                  SizedBox(height: 30),
                  CustomTextFieldWidget(
                    controller: nameController,
                    hint: "Anna Deo",
                    label: "Name",
                    suffixWidget: const Text("*",
                        style: TextStyle(fontSize: 32, color: Colors.red)),
                  ),
                  CustomTextFieldWidget(
                    controller: phoneController,
                    hint: "+91XXXXXXXXX",
                    label: "Phone",
                    suffixWidget: Container(),
                  ),
                  SizedBox(height: 20),
                  const CustomHeaderWidget(
                    title: "Select Card",
                    fontSize: 15,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: ListTile(
                          title: const Text("Pan Card"),
                          leading: Radio(
                            value: 2,
                            groupValue: val,
                            onChanged: (int? value) {
                              setState(() {
                                val = value;
                              });
                            },
                            activeColor: Color(0xff02096B),
                          ),
                        ),
                      ),
                      Flexible(
                        child: ListTile(
                          title: const Text("No Pan Card"),
                          leading: Radio(
                            value: 1,
                            groupValue: val,
                            onChanged: (int? value) {
                              setState(() {
                                val = value;
                              });
                            },
                            activeColor: Color(0xff02096B),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                      child: CustomTextFieldWidget(
                    controller: panNoController,
                    label: "Pan Card No",
                    hint: "",
                    suffixWidget: Row(
                      children: [
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () async {
                            final result = await FilePicker.platform
                                .pickFiles(allowMultiple: true);

                            if (result == null) return;
                            File file = File(result.paths.first!);
                            panCard = CustomFile(
                              stream: file.openRead(),
                              field: "pan",
                              length: await file.length(),
                            );
                            showSnackBar(context, "Uploaded Successfully");
                          },
                          child: Text("Upload"),
                          style: ElevatedButton.styleFrom(),
                        ),
                      ],
                    ),
                  )),
                  Flexible(
                      child: CustomTextFieldWidget(
                    controller: gstNoController,
                    label: "GST No",
                    hint: "",
                    suffixWidget: Row(
                      children: [
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () async {
                            final result =
                                await FilePicker.platform.pickFiles();

                            if (result == null) return;
                            File file = File(result.paths.first!);
                            gst = CustomFile(
                              stream: file.openRead(),
                              field: "pan",
                              length: await file.length(),
                            );
                            showSnackBar(context, "Uploaded Successfully");
                          },
                          child: Text("Upload"),
                          style: ElevatedButton.styleFrom(),
                        ),
                      ],
                    ),
                  )),
                  CustomTextFieldWidget(
                    controller: bankNameController,
                    hint: "Bank Name",
                    label: "Bank Name",
                    suffixWidget: Container(),
                  ),
                  CustomTextFieldWidget(
                    controller: bankAccountNoController,
                    hint: "Bank Account No",
                    label: "Account Number",
                    suffixWidget: Container(),
                  ),
                  Flexible(
                      child: CustomTextFieldWidget(
                    controller: bankCancelledChequeController,
                    label: "Bank Cancelled Cheque",
                    hint: "",
                    suffixWidget: Row(
                      children: [
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () async {
                            final result = await FilePicker.platform
                                .pickFiles(allowMultiple: true);
                            if (result == null) return;
                            File file = File(result.paths.first!);
                            cancelledCheque = CustomFile(
                              stream: file.openRead(),
                              field: "pan",
                              length: await file.length(),
                            );
                            showSnackBar(context, "Uploaded Successfully");
                          },
                          child: Text("Upload"),
                          style: ElevatedButton.styleFrom(),
                        ),
                      ],
                    ),
                  )),
                  CustomTextFieldWidget(
                    controller: upiIDController,
                    hint: "",
                    label: "UPI ID",
                    suffixWidget: Container(),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      profileBloc.add(UpdateBankDetailsEvent(
                          bankDetails: BankDetails(
                              customerId: SessionConstants.user.userId,
                              customerName: nameController.text,
                              accountNumber: bankAccountNoController.text,
                              bankCheque: cancelledCheque,
                              bankName: bankNameController.text,
                              gst: gst,
                              panCard: panCard,
                              phoneNumber: phoneController.text,
                              upiNumber: upiIDController.text)));
                    },
                    child: Text("Update Details"),
                    style: ElevatedButton.styleFrom(fixedSize: Size(353, 50)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
