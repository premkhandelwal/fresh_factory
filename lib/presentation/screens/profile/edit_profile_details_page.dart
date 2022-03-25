import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh/presentation/utils/custom_app_bar.dart';
import 'package:fresh/presentation/utils/custom_header_widget.dart';
import 'package:fresh/presentation/widgets/utils/custom_text_field_widget.dart';

class EditProfileDetailsPage extends StatefulWidget {
  const EditProfileDetailsPage({Key? key}) : super(key: key);

  @override
  State<EditProfileDetailsPage> createState() => _EditProfileDetailsPageState();
}

class _EditProfileDetailsPageState extends State<EditProfileDetailsPage> {
  int? val = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Edit Profile",
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10),
              const CustomHeaderWidget(title: "Basic Info"),
              SizedBox(height: 10),
              CustomTextFieldWidget(
                hint: "+91XXXXXXXXXX",
                label: "Phone",
                suffixWidget: Container(),
              ),
              CustomTextFieldWidget(
                hint: "+91XXXXXXXXX",
                label: "Alternative Phone",
                suffixWidget: Container(),
              ),
              CustomTextFieldWidget(
                hint: "Anniversary",
                label: "Anniversary",
                suffixWidget: Container(),
              ),
              CustomTextFieldWidget(
                hint: "Date of Birth",
                label: "Date of Birth",
                suffixWidget: Container(),
              ),
              CustomTextFieldWidget(
                hint: "",
                label: "Email",
                suffixWidget: Container(),
              ),
              AddressFields(),
              SizedBox(height: 10),
              const CustomHeaderWidget(title: "Delivery Address"),
              AddressFields(),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                child: Text("Update Profile"),
                style: ElevatedButton.styleFrom(fixedSize: Size(353, 50)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddressFields extends StatelessWidget {
  const AddressFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFieldWidget(
          hint: "",
          label: "Address",
          suffixWidget: Container(),
        ),
        CustomTextFieldWidget(
          hint: "",
          label: "Landmark",
          suffixWidget: Container(),
        ),
        Row(
          children: [
            Flexible(
              child: CustomTextFieldWidget(
                label: "Pincode",
                hint: "",
                suffixWidget: Container(),
              ),
            ),
            Flexible(
              child: CustomTextFieldWidget(
                hint: "",
                label: "City",
                suffixWidget: Container(),
              ),
            )
          ],
        ),
        Row(
          children: [
            Flexible(
              child: CustomTextFieldWidget(
                label: "State",
                hint: "",
                suffixWidget: Container(),
              ),
            ),
            Flexible(
              child: CustomTextFieldWidget(
                hint: "",
                label: "Country",
                suffixWidget: Container(),
              ),
            )
          ],
        ),
      ],
    );
  }
}
