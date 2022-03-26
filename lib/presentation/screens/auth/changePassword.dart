import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh/businessLogic/blocs/auth/auth_bloc.dart';
import 'package:fresh/globals/common_function.dart';
import 'package:fresh/presentation/screens/home/uicomponents.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final newPasswordController = TextEditingController();
  final oldPasswordController = TextEditingController();
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
            "Change Password",
            style: TextStyle(
              color: Color(0xff02096B),
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is ChangePasswordSuccessState) {
              showSnackBar(context, "Successfully generated password");
            } else if (state is ChangePasswordFailureState) {
              showSnackBar(context, "Failed to generated password");
            }
          },
          builder: (context, state) {
            if (state is ChangePasswordInProgressState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
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
                            labelText("UserName / Email"),
                            TextFormField(
                              controller: userNameController,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "This is a required field";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter your user name',
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
                            labelText("Old Password"),
                            TextFormField(
                              controller: oldPasswordController,
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
                                hintText: 'Enter your current password here',
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
                            labelText("New Password"),
                            TextFormField(
                              controller: newPasswordController,
                              /* validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "This is a required field";
                                }
                                RegExp reg = RegExp(
                                    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*]).{8,}$');
                                if (!reg.hasMatch(val)) {
                                  return "Please enter a strong password";
                                }
                                return null;
                              }, */
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'Enter your new password here',
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
                              height: MediaQuery.of(context).size.height / 5,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState != null) {
                                  if (_formKey.currentState!.validate()) {
                                    authBloc.add(ChangePasswordEvent(
                                        userName: userNameController.text,
                                        oldPassword: oldPasswordController.text,
                                        newPassword:
                                            newPasswordController.text));
                                  }
                                } else {
                                  showSnackBar(
                                      context, "Failed to submit form");
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
                                    borderRadius:
                                        new BorderRadius.circular(9.0),
                                  ),
                                  fixedSize: Size(353, 62)),
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
