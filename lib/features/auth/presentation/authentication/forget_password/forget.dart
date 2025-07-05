import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'FindAccountScreen.dart';
import 'FindAccountScreenEmail.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  bool isSmsSelected = true;
  bool isEmailSelected = false;

  @override
  void dispose() {
    super.dispose();
  }

  void navigateToOTCVerification() {
    if (isSmsSelected) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FindAccount()),
      );
    } else if (isEmailSelected) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FindAccountScreenEmail()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/images/first.png', height: 200.h),
                  SizedBox(height: 20.h),
                  Text(
                    'Select Which Contact details should we use to recover your password',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSmsSelected = true;
                        isEmailSelected = false;
                      });
                    },
                    child: Container(
                      padding: REdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: isSmsSelected ? Colors.blue : Colors.grey,
                        ),
                        color: isSmsSelected
                            ? Colors.blue.withOpacity(0.1)
                            : Colors.transparent,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.message,
                            color: isSmsSelected ? Colors.blue : Colors.grey,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            'Via SMS',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: isSmsSelected ? Colors.blue : Colors.grey,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '+201******91',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: isSmsSelected ? Colors.blue : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSmsSelected = false;
                        isEmailSelected = true;
                      });
                    },
                    child: Container(
                      padding: REdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: isEmailSelected ? Colors.blue : Colors.grey,
                        ),
                        color: isEmailSelected
                            ? Colors.blue.withOpacity(0.1)
                            : Colors.transparent,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: isEmailSelected ? Colors.blue : Colors.grey,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            'Via Email',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: isEmailSelected
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'example@example.com',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: isEmailSelected
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  ElevatedButton(
                    onPressed: () {
                      navigateToOTCVerification();
                    },
                    style: ElevatedButton.styleFrom(),
                    child: Text(
                      'Continue',
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
