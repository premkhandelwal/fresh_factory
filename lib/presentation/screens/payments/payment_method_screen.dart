import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh/presentation/utils/custom_app_bar.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final payTMImage = const AssetImage("assets/paytm.png");
  final googleImage = const AssetImage("assets/gPay.png");
  final visaImage = const AssetImage("assets/visa.jpg");
  final upiImage = const AssetImage("assets/upi.jpg");
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Add Payment Method"),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: [
            ListTile(
              selected: _selectedIndex == 0,
              tileColor: Colors.white,
              shape: _selectedIndex == 0
                  ? RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xFF0D47A1), width: 2.w),
                    )
                  : null,
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
              leading: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image(
                  image: payTMImage,
                  width: 90.w,
                ),
              ),
              title: const Center(
                  child: Text(
                "Paytm",
                style: TextStyle(color: Colors.grey),
              )),
            ),
            SizedBox(height: 40.h),
            ListTile(
              selected: _selectedIndex == 1,
              tileColor: Colors.white,
              shape: _selectedIndex == 1
                  ? RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xFF0D47A1), width: 2.w),
                    )
                  : null,
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
              leading: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image(
                  image: googleImage,
                ),
              ),
              title: const Center(
                  child: Text(
                "GPay",
                style: TextStyle(color: Colors.grey),
              )),
            ),
            SizedBox(height: 40.h),
            ListTile(
              selected: _selectedIndex == 2,
              tileColor: Colors.white,
              shape: _selectedIndex == 2
                  ? RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xFF0D47A1), width: 2.w),
                    )
                  : null,
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });
              },
              leading: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image(
                  image: visaImage,
                ),
              ),
              title: const Center(
                  child: Text(
                "Visa Card",
                style: TextStyle(color: Colors.grey),
              )),
            ),
            SizedBox(height: 40.h),
            ListTile(
              selected: _selectedIndex == 3,
              tileColor: Colors.white,
              shape: _selectedIndex == 3
                  ? RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xFF0D47A1), width: 2.w),
                    )
                  : null,
              onTap: () {
                setState(() {
                  _selectedIndex = 3;
                });
              },
              leading: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image(
                  image: upiImage,
                ),
              ),
              title: const Center(
                  child: Text(
                "UPI",
                style: TextStyle(color: Colors.grey),
              )),
            ),
            SizedBox(height: 50.h),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Add Payment Method"),
              style: ElevatedButton.styleFrom(fixedSize: const Size(353, 57)),
            ),
          ],
        ),
      ),
    );
  }
}

