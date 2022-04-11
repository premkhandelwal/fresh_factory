import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh/businessLogic/blocs/auth/auth_bloc.dart';
import 'package:fresh/data/models/user.dart';
import 'package:fresh/globals/common_function.dart';
import 'package:fresh/presentation/screens/auth/forgot_password_screen.dart';
import 'package:fresh/presentation/screens/home/home_screen.dart';
import 'package:fresh/presentation/screens/home/main_home_page.dart';
// import 'package:fresh/presentation/screens/home/main_home_page.dart';
import 'package:fresh/presentation/screens/home/uicomponents.dart';

class LoginScreen extends StatefulWidget {
  static String route = '/loginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late AuthBloc authBloc;
  @override
  void initState() {
    authBloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  final phoneNoController = TextEditingController();
  final passwordController = TextEditingController();

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
            "Login",
            style: TextStyle(
              color: Color(0xff02096B),
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is SignInSuccessState) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                MainHomePage.route,
                (route) => false
              );
            } else if (state is SignInFailureState) {
              showSnackBar(context, "Failed to sign in. Please try again");
            } else if (state is UserUnauthorizedState) {
              showSnackBar(context, "Unauthorized user access");
            } else if (state is GenerateAccessTokenFailureState) {
              showSnackBar(context, "No user found with the credentails");
            }
          },
          builder: (context, state) {
            if (state is SignInProgressState ||
                state is GenerateAccessTokenInProgressState) {
              return Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                // width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 12,
                    ),
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
                            labelText("Phone"),
                            TextFormField(
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "This is a required field";
                                }
                                /*  if (val.length < 10) {
                                  return "Please enter a valid phone number";
                                } */
                                return null;
                              },
                              controller: phoneNoController,
                              // keyboardType: TextInputType.number,
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
                            labelText("Password"),
                            TextFormField(
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "This is a required field";
                                }
                                /*  RegExp reg = RegExp(
                                    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*]).{8,}$');
                                if (!reg.hasMatch(val)) {
                                  return "Please enter a strong password";
                                } */
                                return null;
                              },
                              controller: passwordController,
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: InputDecoration(
                                  hintText: 'Enter your password',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 5.0),
                                  )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                        context,
                        ForgotPass.route,
                      );
                                      
                                    },
                                    child: labelText("Forgot Password?"),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState != null) {
                                  if (_formKey.currentState!.validate()) {
                                    authBloc.add(GenerateAccessTokenEvent(
                                        user: User(
                                            userName: phoneNoController.text,
                                            password:
                                                passwordController.text)));
                                  }
                                } else {
                                  showSnackBar(
                                      context, "Failed to submit form");
                                }
                              },
                              child: Text(
                                "Login",
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
                                minWidth: 320,
                                height: 50,
                                color: Color(0xff02096B),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(9.0),
                                ),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 17,
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState != null) {
                                    if (_formKey.currentState!.validate()) {
                                      authBloc.add(GenerateAccessTokenEvent(
                                          user: User(
                                              phoneNumber:
                                                  phoneNoController.text,
                                              password:
                                                  passwordController.text)));
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
