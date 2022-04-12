import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fresh/businessLogic/blocs/auth/auth_bloc.dart';
import 'package:fresh/config/args.dart';
import 'package:fresh/globals/common_function.dart';
import 'package:fresh/presentation/screens/auth/veriify.dart';
import 'package:fresh/presentation/screens/home/uicomponents.dart';

class ForgotPass extends StatefulWidget {
  static String route = '/forgotPasswordScreen';
  const ForgotPass({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  late AuthBloc authBloc;

  @override
  void initState() {
    authBloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SendOTPArgs;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xff02096B)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: Text(
            args.isForgotPassScreen
                ? "Forgot Password"
                : "Verify Email Address",
            style: TextStyle(
              color: Color(0xff02096B),
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is ResetPasswordSuccessState) {
              Navigator.pushNamed(context, VerifyOtp.route,
                  arguments: VerifyOTPArgs(emailId: emailController.text, isForgotPassword: args.isForgotPassScreen));
            } else if (state is ResetPasswordFailureState) {
              showSnackBar(
                  context, "Failed to reset password. Please try again later");
            }
          },
          builder: (context, state) {
            if (state is ResetPasswordInProgressState) {
              return Center(child: CircularProgressIndicator());
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
                          labelText("Email or Phone"),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'Enter your Email or Phone Number',
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
                            height: MediaQuery.of(context).size.height / 3,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              authBloc.add(ForgotPasswordEvent(
                                  email: emailController.text));
                              /*  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => VerifyOtp()),
                                    ); */
                            },
                            child: Text(
                              "Send OTP",
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
