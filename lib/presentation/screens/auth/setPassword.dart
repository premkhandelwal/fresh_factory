import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh/businessLogic/blocs/auth/auth_bloc.dart';
import 'package:fresh/globals/common_function.dart';
import 'package:fresh/presentation/screens/home/uicomponents.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({Key? key}) : super(key: key);

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confpasswordController = TextEditingController();
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
            "Set Password",
            style: TextStyle(
              color: Color(0xff02096B),
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is SetPasswordSuccessState) {
              showSnackBar(context, "Successfully generated password");
            } else if (state is SetPasswordFailureState) {
              showSnackBar(context, "Failed to generated password");
            }
          },
          builder: (context, state) {
            if (state is SetPasswordInProgressState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  Image.asset(
                    "assets/logo.png",
                    height: MediaQuery.of(context).size.height / 5,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 28,
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      margin: EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          labelText("Your Password"),
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
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'Enter your new password',
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
                          labelText("Confirm Password"),
                          TextFormField(
                            validator: (val) {
                              if (val != passwordController.text) {
                                return "Passwords do not match";
                              }
                              return null;
                            },
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'Enter your new password again',
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
                            height: MediaQuery.of(context).size.height / 5,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState != null) {
                                if (_formKey.currentState!.validate()) {
                                  authBloc.add(SetPasswordEvent(
                                      email: "abcd@gmail.com",
                                      password: passwordController.text));
                                }
                              } else {
                                showSnackBar(context, "Failed to submit form");
                              }
                            },
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 17,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(9.0),
                                ),
                                fixedSize: Size(353, 62)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
