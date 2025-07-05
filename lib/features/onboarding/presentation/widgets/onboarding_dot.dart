import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingDot extends StatelessWidget {
  final int index;
  final int currentPage;

  const OnboardingDot({
    super.key,
    required this.index,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.only(right: 5),
      height: 5.h,
      width: currentPage == index ? 40 : 20,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.blue : Colors.black,
        borderRadius: BorderRadius.circular(5.r),
      ),
    );
  }
}
