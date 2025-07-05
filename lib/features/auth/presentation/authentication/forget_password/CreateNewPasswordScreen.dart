import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ready_hire/core/resources/assets_manager.dart';

import '../test/SuccessPage.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  _CreateNewPasswordState createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  bool _isPasswordVisible1 = false;
  bool _isPasswordVisible2 = false;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Password"),

        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(ImageAssets.logo, height: 150.h),
              SizedBox(height: 40.h),

              Text(
                "Create your New Password",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20.h),
              TextField(
                obscureText: !_isPasswordVisible1,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  hintText: "New password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible1
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible1 = !_isPasswordVisible1;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              TextField(
                obscureText: !_isPasswordVisible2,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  hintText: "Confirm New password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible2
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible2 = !_isPasswordVisible2;
                      });
                    },
                  ),
                ),
              ),

              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value!;
                      });
                    },
                  ),
                  Text("Remember me"),
                ],
              ),
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SuccessPage(
                        text:
                            "password is set Correctly and your Account is ready to use you will redirected to Home page.",
                      ),
                    ),
                  );
                },

                child: Text("continue"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
