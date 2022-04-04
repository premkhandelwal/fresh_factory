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
                  MaterialPageRoute(builder: (ctx) => VerifyOtp(emailId: emailIdController.text,)),);
            } else if (state is SignUpFailureState) {
              showSnackBar(context, "Failed to sign up. Please try again");
            }else if(state is UserAlreadyExistsState){
              showSnackBar(context, "User email ID already exists. Please login using the same");

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
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "This is a required field";
                                }
                                if (val.length < 2) {
                                  return "Please enter a valid name";
                                }
                                return null;
                              },
                              controller: nameController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'Enter your Name',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff02096B), width: 1.0),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff02096B), width: 1.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff02096B), width: 1.0),
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
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "This is a required field";
                                }
                                if (val.length < 2) {
                                  return "Please enter a valid name";
                                }
                                return null;
                              },
                              controller: phoneNoController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Enter your Phone Number',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff02096B), width: 1.0),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff02096B), width: 1.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff02096B), width: 1.0),
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
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "This is a required field";
                                }
                                RegExp regExp = RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                                if (!regExp.hasMatch(val)) {
                                  return "Please enter a valid email";
                                }
                                return null;
                              },
                              controller: emailIdController,
                              // keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Enter your Email ID Here',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff02096B), width: 1.0),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff02096B), width: 1.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff02096B), width: 1.0),
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
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "This is a required field";
                                }
                                RegExp reg = RegExp(
                                    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*]).{8,}$');
                                if (!reg.hasMatch(val)) {
                                  return "Please enter a strong password";
                                }
                                return null;
                              },
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
                              validator: (val) {
                                if (val != passwordController.text) {
                                  return "Passwords do not match";
                                }
                                return null;
                              },
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
                                      color: Color(0xff02096B), width: 1.0),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff02096B), width: 1.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff02096B), width: 1.0),
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
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: value == false
                                  ? null
                                  : () {
                                      if (_formKey.currentState != null) {
                                        if (_formKey.currentState!.validate()) {
                                          authBloc.add(SignUpRequestedEvent(
                                              user: User(
                                                userName: nameController.text,
                                                  phoneNumber:
                                                      phoneNoController.text,
                                                  password:
                                                      passwordController.text,
                                                  emailId:
                                                      emailIdController.text)));
                                        }
                                      } else {
                                        showSnackBar(
                                            context, "Failed to submit form");
                                      }
                                    },
                              child: Text(
                                "Signup",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 17,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(9.0),
                                  ),
                                  fixedSize: Size(353, 62)),
                            ),
                            /* Container(
                              width: double.infinity,
                              height: 60,
                              child: MaterialButton(
                                minWidth: 280,
                                height: 55,
                                disabledColor:
                                    Color.fromARGB(255, 106, 109, 141),
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
                                onPressed: value == false
                                    ? null
                                    : () {
                                        if (_formKey.currentState != null) {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            authBloc.add(SignUpRequestedEvent(
                                                user: User(
                                                    phoneNumber:
                                                        phoneNoController.text,
                                                    password:
                                                        passwordController.text,
                                                    emailId: emailIdController
                                                        .text)));
                                          }
                                        } else {
                                          showSnackBar(
                                              context, "Failed to submit form");
                                        }
                                      },
                              ),
                            ), */
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
