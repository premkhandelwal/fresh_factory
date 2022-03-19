import 'package:flutter/material.dart';
import 'package:fresh/presentation/utils/custom_header_widget.dart';

class BankDetailsScreen extends StatefulWidget {
  const BankDetailsScreen({Key? key}) : super(key: key);

  @override
  _BankDetailsScreenState createState() => _BankDetailsScreenState();
}

int? val = -1;

class _BankDetailsScreenState extends State<BankDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bank Details Screen"),
        backgroundColor: Colors.white,
        foregroundColor: Color(0xff02096B),
        titleTextStyle: TextStyle(
            color: Color(0xff02096B),
            fontSize: 20,
            fontWeight: FontWeight.bold),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 30),
              const CustomHeaderWidget(title: "Bank Details"),
              const SizedBox(height: 30),
              CustomTextFieldWidget(
                hint: "Anna Deo",
                label: "Name",
                suffixWidget: const Text("*",
                    style: TextStyle(fontSize: 32, color: Colors.red)),
              ),
              CustomTextFieldWidget(
                hint: "+91XXXXXXXXX",
                label: "Phone",
                suffixWidget: Container(),
              ),
              const SizedBox(height: 20),
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
                label: "Pan Card No",
                hint: "",
                suffixWidget: Row(
                  children: [
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Upload"),
                      style: ElevatedButton.styleFrom(),
                    ),
                  ],
                ),
              )),
              Flexible(
                  child: CustomTextFieldWidget(
                label: "GST No",
                hint: "",
                suffixWidget: Row(
                  children: [
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Upload"),
                      style: ElevatedButton.styleFrom(),
                    ),
                  ],
                ),
              )),
              CustomTextFieldWidget(
                hint: "Bank Name",
                label: "Bank Name",
                suffixWidget: Container(),
              ),
              CustomTextFieldWidget(
                hint: "Bank Account No",
                label: "Account Number",
                suffixWidget: Container(),
              ),
              Flexible(
                  child: CustomTextFieldWidget(
                label: "Bank Cancelled Cheque",
                hint: "",
                suffixWidget: Row(
                  children: [
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Upload"),
                      style: ElevatedButton.styleFrom(),
                    ),
                  ],
                ),
              )),
              CustomTextFieldWidget(
                hint: "",
                label: "UPI ID",
                suffixWidget: Container(),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                child: Text("Update Details"),
                style: ElevatedButton.styleFrom(fixedSize: Size(353, 50)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFieldWidget extends StatelessWidget {
  final String label;
  final String hint;
  final Widget suffixWidget;
  CustomTextFieldWidget({
    required this.label,
    required this.hint,
    required this.suffixWidget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHeaderWidget(
          title: label,
          fontSize: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            children: [
              Flexible(
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: hint, border: const OutlineInputBorder()),
                ),
              ),
              suffixWidget
            ],
          ),
        ),
      ],
    );
  }
}
