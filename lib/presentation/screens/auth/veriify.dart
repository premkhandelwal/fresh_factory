import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh/presentation/screens/auth/setPassword.dart';
import 'package:fresh/presentation/screens/home/uicomponents.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({Key? key}) : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            "Verification",
            style: TextStyle(
              color: Color(0xff02096B),
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
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
                      labelText("Enter your OTP"),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration:  InputDecoration(
                          hintText: 'Enter your six digit OTP',
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
                        height: MediaQuery.of(context).size.height / 9,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            labelText("Resend OTP"),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              decoration: BoxDecoration(
                                color: Color(0xff02096B),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  radius: 30.0,
                                  onTap: () {},
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 9,
                      ),
                      Container(
                        width: double.infinity,
                        child: MaterialButton(
                          minWidth: 280.w,
                          height: 58.h,
                          color: Color(0xff02096B),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(9.0),
                          ),
                          child: const Text(
                            "Verify",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 17,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SetPassword()),
                            );
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
      ),
    );
  }
}
