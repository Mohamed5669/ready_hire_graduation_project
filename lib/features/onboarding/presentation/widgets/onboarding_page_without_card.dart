import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPageWithoutCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const OnboardingPageWithoutCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 300.h, width: 200.w),
          Text(
            title,
            style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5.h),
          Text(
            description,
            style: TextStyle(fontSize: 14.sp),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
