import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/assets_manager.dart';
import 'OTCVerificationEmail.dart';

class FindAccountScreenEmail extends StatelessWidget {
  const FindAccountScreenEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find Your Account"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(ImageAssets.second, height: 200.h),
              SizedBox(height: 20.h),
              Text(
                "Enter your Email",
                style: TextStyle(fontSize: 20.sp, color: Colors.grey[700]),
              ),
              SizedBox(height: 20.h),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email address",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),

              SizedBox(height: 20.h),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OTCVerificationEmail(),
                    ),
                  );
                },

                child: Text("Continue"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
