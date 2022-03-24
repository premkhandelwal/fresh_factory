import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh/businessLogic/blocs/auth/auth_bloc.dart';
import 'package:fresh/data/models/user.dart';
import 'package:fresh/globals/common_function.dart';
import 'package:fresh/presentation/screens/auth/veriify.dart';
import 'package:fresh/presentation/screens/home/uicomponents.dart';
import 'package:fresh/presentation/utils/custom_header_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  bool? value = false;

  final nameController = TextEditingController();
  final phoneNoController = TextEditingController();
  final emailIdController = TextEditingController();
  final passwordController = TextEditingController();
  final confPasswordController = TextEditingController();
  final referralCodeController = TextEditingController();
  late AuthBloc authBloc;

  @override
  void initState() {
    authBloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xff02096B)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: Text(
            "Signup",
            style: TextStyle(
              color: Color(0xff02096B),
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is SignUpSuccessState) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => VerifyOtp()),
              );
            } else if (state is SignUpFailureState) {
              showSnackBar(context, "Failed to sign up. Please try again");
            }
          },
          builder: (context, state) {
            if (state is SignUpProgressState) {
              return Center(child: CircularProgressIndicator());
            }
            return Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height / 12,
                    // ),
                    Image.asset(
                      "assets/logo.png",
                      height: MediaQuery.of(context).size.height / 5,
                    ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height / 28,
                    // ),
                    Form(
                      key: _formKey,
                      child: Container(
                        margin: EdgeInsets.all(25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CustomHeaderWidget(
                                title: "Name",
                                fontSize: 15,
                                isPaddingReq: false),
                            TextFormField(
                              controller: nameController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'Enter your Name',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff02096B), width: 1.0.w),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff02096B), width: 1.0.w),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff02096B), width: 1.0.w),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 50,
                            ),
                            CustomHeaderWidget(
                                title: "Phone",
                                fontSize: 15,
                                isPaddingReq: false),
                            TextFormField(
                              controller: phoneNoController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Enter your Phone Number',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff02096B), width: 1.0.w),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff02096B), width: 1.0.w),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff02096B), width: 1.0.w),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 50,
                            ),
                            CustomHeaderWidget(
                                title: "Email",
                                fontSize: 15,
                                isPaddingReq: false),
                            TextFormField(
                              controller: emailIdController,
                              // keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Enter your Email ID Here',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff02096B), width: 1.0.w),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff02096B), width: 1.0.w),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff02096B), width: 1.0.w),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 50,
                            ),
                            CustomHeaderWidget(
                                title: "Password",
                                fontSize: 15,
                                isPaddingReq: false),
                            TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: const InputDecoration(
                                  hintText: 'Enter your password',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 5.0),
                                  )),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 50,
                            ),
                            CustomHeaderWidget(
                                title: "Confirm Password",
                                fontSize: 15,
                                isPaddingReq: false),
                            TextFormField(
                              controller: confPasswordController,
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: const InputDecoration(
                                  hintText: 'Enter your password',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 5.0),
                                  )),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 50,
                            ),
                            CustomHeaderWidget(
                                title: "Referral Code",
                                fontSize: 15,
                                isPaddingReq: false),
                            TextFormField(
                              controller: referralCodeController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'Enter Referral code',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff02096B), width: 1.0.w),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff02096B), width: 1.0.w),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff02096B), width: 1.0.w),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  value: this.value,
                                  onChanged: (bool? val) {
                                    setState(() {
                                      this.value = val;
                                    });
                                  },
                                ),
                                labelText("Terms and Condition Apply")
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Container(
                              width: double.infinity,
                              height: 60.h,
                              child: MaterialButton(
                                minWidth: 280.w,
                                height: 55.h,
                                color: Color(0xff02096B),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(9.0),
                                ),
                                child: const Text(
                                  "Signup",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 17,
                                  ),
                                ),
                                onPressed: () {
                                  authBloc.add(SignUpRequestedEvent(
                                      user: User(
                                          phoneNumber: phoneNoController.text,
                                          password: passwordController.text,
                                          emailId: emailIdController.text)));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
