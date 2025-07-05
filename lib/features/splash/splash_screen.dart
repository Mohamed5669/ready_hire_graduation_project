import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/resources/assets_manager.dart';
import '../../core/resources/constant_manager.dart';
import '../../core/routes_manager/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        RoutesManager.onBoarding,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            ImageAssets.intro,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 12.w,
            bottom: 150.h,
            right: 5.w,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    ConstantsManager.welcome,

                    style: TextStyle(
                      fontFamily: 'Konkhmer Sleokchher',
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    ConstantsManager.description,
                    style: TextStyle(
                      fontFamily: 'Konkhmer Sleokchher',
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
