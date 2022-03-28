import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh/businessLogic/blocs/profile/profile_bloc.dart';
import 'package:fresh/data/models/user.dart';
import 'package:fresh/globals/common_function.dart';
import 'package:fresh/globals/constants/sessionConstants.dart';
import 'package:intl/intl.dart';
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
  final phoneController = TextEditingController();
  final alternativePhoneController = TextEditingController();
  final dateofBirthController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final landMarkController = TextEditingController();
  final pinCodeController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();
  final deliveryAddressController = TextEditingController();
  final deliveryLandMarkController = TextEditingController();
  final deliveryPinCodeController = TextEditingController();
  final deliveryCityController = TextEditingController();
  final deliveryStateController = TextEditingController();
  final deliveryCountryController = TextEditingController();

  late ProfileBloc profileBloc;
  @override
  void initState() {
    profileBloc = BlocProvider.of<ProfileBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Edit Profile",
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is UpdateUserDetailsSuccessState) {
            showSnackBar(context, "Updated details successfully");
          } else if (state is UpdateUserDetailsFailureState) {
            showSnackBar(context, "Failed to update details");
          }
        },
        builder: (context, state) {
          if (state is UpdateUserDetailsInProgressState) {
            return Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10),
                  const CustomHeaderWidget(title: "Basic Info"),
                  SizedBox(height: 10),
                  CustomTextFieldWidget(
                    controller: phoneController,
                    hint: "+91XXXXXXXXXX",
                    label: "Phone",
                    suffixWidget: Container(),
                  ),
                  CustomTextFieldWidget(
                    controller: alternativePhoneController,
                    hint: "+91XXXXXXXXX",
                    label: "Alternative Phone",
                    suffixWidget: Container(),
                  ),
                  CustomTextFieldWidget(
                    controller: phoneController,
                    hint: "Anniversary",
                    label: "Anniversary",
                    suffixWidget: Container(),
                  ),
                  CustomHeaderWidget(
                    title: "Date of Birth",
                    fontSize: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: TextFormField(
                        readOnly: true,
                        controller: dateofBirthController,
                        decoration: InputDecoration(
                            hintText: "Date of Birth",
                            border: const OutlineInputBorder()),
                        onTap: () async {
                          await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(3000),
                          ).then((selectedDate) {
                            if (selectedDate != null) {
                              dateofBirthController.text =
                                  DateFormat('yyyy-MM-dd').format(selectedDate);
                            }
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter date.';
                          }
                          return null;
                        },
                      )),
                  /*  CustomTextFieldWidget(
                      readOnly: true,
                      controller: dateofBirthController,
                      hint: "Date of Birth",
                      label: "Date of Birth",
                      suffixWidget: Container(),
                    ), */
                  CustomTextFieldWidget(
                    controller: emailController,
                    hint: "",
                    label: "Email",
                    suffixWidget: Container(),
                  ),
                  AddressFields(
                      addressController: addressController,
                      cityController: cityController,
                      countryController: countryController,
                      landMarkController: landMarkController,
                      pinCodeController: pinCodeController,
                      stateController: stateController),
                  SizedBox(height: 10),
                  const CustomHeaderWidget(title: "Delivery Address"),
                  AddressFields(
                      addressController: deliveryAddressController,
                      cityController: deliveryCityController,
                      countryController: deliveryCountryController,
                      landMarkController: deliveryLandMarkController,
                      pinCodeController: deliveryPinCodeController,
                      stateController: deliveryStateController),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      SessionConstants.user = User(
                          address: addressController.text,
                          alternatePhoneNumber: alternativePhoneController.text,
                          city: cityController.text,
                          country: countryController.text,
                          dateOfBirth: dateofBirthController.text,
                          deliveryAddress: deliveryAddressController.text,
                          deliveryCity: deliveryCityController.text,
                          deliveryCountry: deliveryCountryController.text,
                          deliveryLandMark: deliveryLandMarkController.text,
                          deliveryPinCode: deliveryPinCodeController.text,
                          deliveryState: deliveryStateController.text,
                          emailId: emailController.text,
                          landMark: landMarkController.text,
                          phoneNumber: phoneController.text,
                          pinCode: pinCodeController.text,
                          state: stateController.text,
                          userId: SessionConstants.user.userId,
                          accessToken: SessionConstants.user.accessToken,
                          password: SessionConstants.user.password,
                          referralCode: SessionConstants.user.referralCode,
                          refreshToken: SessionConstants.user.refreshToken,
                          userName: SessionConstants.user.userName);
                      profileBloc.add(
                          UpdateUserDetailsEvent(user: SessionConstants.user));
                    },
                    child: Text("Update Profile"),
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

class AddressFields extends StatelessWidget {
  final TextEditingController addressController;
  final TextEditingController landMarkController;
  final TextEditingController pinCodeController;
  final TextEditingController cityController;
  final TextEditingController stateController;
  final TextEditingController countryController;
  AddressFields({
    Key? key,
    required this.addressController,
    required this.landMarkController,
    required this.pinCodeController,
    required this.cityController,
    required this.stateController,
    required this.countryController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFieldWidget(
          controller: addressController,
          hint: "",
          label: "Address",
          suffixWidget: Container(),
        ),
        CustomTextFieldWidget(
          controller: landMarkController,
          hint: "",
          label: "Landmark",
          suffixWidget: Container(),
        ),
        Row(
          children: [
            Flexible(
              child: CustomTextFieldWidget(
                controller: pinCodeController,
                label: "Pincode",
                hint: "",
                suffixWidget: Container(),
              ),
            ),
            Flexible(
              child: CustomTextFieldWidget(
                controller: cityController,
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
                controller: stateController,
                label: "State",
                hint: "",
                suffixWidget: Container(),
              ),
            ),
            Flexible(
              child: CustomTextFieldWidget(
                controller: countryController,
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
